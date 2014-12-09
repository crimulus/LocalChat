//
//  ConnectViewController.m
//  LocalChat
//
//  Created by Tharp, Jeremy on 11/24/14.
//  Copyright (c) 2014 Tharp, Jeremy. All rights reserved.
//

#import "ConnectViewController.h"
#import "CustomTableViewCell.h"

@interface ConnectViewController ()

@end

@implementation ConnectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.connectedPeers = appDelegate.mpcManager.connectedPeers;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(MPCDidChangeState:)
                                                 name:@"MPCDidChangeStateNotification"
                                               object:nil];
}

- (IBAction)browse:(id)sender {
    [appDelegate.mpcManager setupMCBrowser];
    [[appDelegate.mpcManager browser] setDelegate:self];
    [self presentViewController:[appDelegate.mpcManager browser] animated:YES completion:nil];
}

- (void)MPCDidChangeState:(NSNotification *)notification {
    
}

/********************************************
** MCBrowserViewControllerDelegate Methods **
********************************************/

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController {
    [appDelegate.mpcManager.browser dismissViewControllerAnimated:YES completion:^{}];
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController {
    [appDelegate.mpcManager.browser dismissViewControllerAnimated:YES completion:^{}];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma -mark
#pragma TableView datasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //returns the number of sections you need.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //how many rows are in each of the above sections (Total number of cells needing to be displayed).
    return self.connectedPeers.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //This sets the size of the cell at any given index.
    return 42;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //The actual code to return each cell, configured with the data you want to display.
    
    static NSString *CellIdentifier = @"BitchinCellType";
    
    CustomTableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    cell.theLabel.text = @"No array :(";
    cell.theLabel.textColor = [UIColor grayColor];
//    cell.detailTextLabel.text = @"No array here either :(((";
    cell.theImage.image = [UIImage imageNamed:@"jog_tab_right_confirm_yellow"];
    
    return cell;
    
}

#pragma -mark
#pragma TableView delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //This delegate method gets call when a user taps a TableView cell. This method sends the index of the tapped cell in the indexpath argument.
    
    //Show an animated deselection of the selected cell.
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
