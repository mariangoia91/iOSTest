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

static NSString * const kUserCellIdentifier = @"UserCellIdentifier";
const CGFloat kContactCellHeight = 56.0;

@interface ISecondViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *allContactGroups;

@end

@implementation ISecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"IUserTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kUserCellIdentifier];
    
    [self requestContacts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.allContactGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((IGroup*)[self.allContactGroups objectAtIndex:section]).people.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return ((IGroup*)[self.allContactGroups objectAtIndex:section]).groupName;
}

#pragma mark - TableView Delegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kContactCellHeight;
}

@end
