//
//  ISecondViewController.m
//  Interview
//
//  Created by Marian Goia on 25/02/15.
//  Copyright (c) 2015 Marian Goia. All rights reserved.
//

#import "ISecondViewController.h"

#import "WSManager.h"
#import "IContacts.h"
#import "IGroup.h"
#import "IContact.h"

#import "IUserTableViewCell.h"

#import "UIImage+Additions.h"

static NSString * const kUserCellIdentifier = @"UserCellIdentifier";

const CGFloat kContactCellHeight = 56.0;

@interface ISecondViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>
{
    NSMutableArray  *_filteredContactGroups;
    BOOL            _isFiltered;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSArray *allContactGroups;

@end

@implementation ISecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _filteredContactGroups = [NSMutableArray array];
    _isFiltered = NO;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"IUserTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kUserCellIdentifier];
    [self.tableView setContentOffset:CGPointMake(0,44) animated:YES]; // Hide the search bar
    
    [self requestContacts];
}

#pragma mark - Utils

- (void)requestContacts {
    [[WSManager sharedManager] requestAllContactGroupsWithCompetionBlock:^(IContacts *contacts, NSError *error) {
        if (!error) {
            self.allContactGroups = contacts.groups;
            
            [self.tableView reloadData];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:[NSString stringWithFormat:@"Getting the contacts list has failed with the following error: %@", error.localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
    }];
}

#pragma mark - TableView Datasource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kUserCellIdentifier forIndexPath:indexPath];
    
    IGroup *currentGroup = _isFiltered ? [_filteredContactGroups objectAtIndex:indexPath.section] : [self.allContactGroups objectAtIndex:indexPath.section];
    IContact *currentContact = [currentGroup.people objectAtIndex:indexPath.row];
    
    [cell.nameLabel setText:[NSString stringWithFormat:@"%@ %@", currentContact.firstName, currentContact.lastName]];
    [cell.statusMessageLabel setText:currentContact.statusMessage];
    [cell.statusIconImageView setImage:[UIImage imageForStatus:currentContact.statusIcon]];
    [cell.userIconImageView setImage:[UIImage imageForAvatar:@""]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _isFiltered ? _filteredContactGroups.count : self.allContactGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _isFiltered ? ((IGroup*)[_filteredContactGroups objectAtIndex:section]).people.count : ((IGroup*)[self.allContactGroups objectAtIndex:section]).people.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _isFiltered ? ((IGroup*)[_filteredContactGroups objectAtIndex:section]).groupName : ((IGroup*)[self.allContactGroups objectAtIndex:section]).groupName;
}

#pragma mark - TableView Delegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kContactCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - SearchBar Delegate methods

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
    
    self.searchBar.text = @"";
    _isFiltered = NO;
    [self.tableView reloadData];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
    
    return YES;
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:YES];
    
    return YES;
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    if(searchBar.text.length == 0) {
        _isFiltered = NO;
    } else {
        _isFiltered = YES;
        _filteredContactGroups = [NSMutableArray array];
        
        for (int i = 0; i < self.allContactGroups.count; i++) {
            
            IGroup *filteredGroup = [[self.allContactGroups objectAtIndex:i] copy];
            NSMutableArray *filteredPeople = [NSMutableArray array];
            
            for (IContact* contact in filteredGroup.people) {
                
                NSString *fullName = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
                
                NSRange nameRange = [fullName rangeOfString:searchBar.text options:NSCaseInsensitiveSearch];

                if(nameRange.location != NSNotFound) {
                    [filteredPeople addObject:contact];
                }
            }
            
            filteredGroup.people = [NSArray arrayWithArray:filteredPeople];
            [_filteredContactGroups addObject:filteredGroup];
        }
    }
    
    [self.tableView reloadData];
}

#pragma mark - Button actions

- (IBAction)groupsButtonPressed:(id)sender {
    // To be implemented
}

- (IBAction)addContactButtonPressed:(id)sender {
    // To be implemented
}

@end
