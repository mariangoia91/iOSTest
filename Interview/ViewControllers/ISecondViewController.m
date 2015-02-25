//
//  ISecondViewController.m
//  Interview
//
//  Created by Marian Goia on 25/02/15.
//  Copyright (c) 2015 Marian Goia. All rights reserved.
//

#import "ISecondViewController.h"
#import "IUserTableViewCell.h"

static NSString * const kUserCellIdentifier = @"UserCellIdentifier";

@interface ISecondViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ISecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"IUserTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kUserCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Datasource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IUserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kUserCellIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - TableView Delegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

@end
