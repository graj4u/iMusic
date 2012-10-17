//
//  LikeViewController.m
//  MyMusicApp
//
//  Created by Gaurav Raj on 9/27/12.
//  Copyright (c) 2012 GRaj. All rights reserved.
//

#import "LikeViewController.h"

@interface LikeViewController ()

@end

@implementation LikeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_myTableView release];
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.row==0) {
        
        cell.textLabel.text = @"Facebook";
        cell.detailTextLabel.text = @"Like Us";
    }
    else if (indexPath.row==1) {
        
        cell.textLabel.text = @"Youtube";
        cell.detailTextLabel.text = @"Like Us";
    }
    else if (indexPath.row==2) {
        
        cell.textLabel.text = @"Twitter";
        cell.detailTextLabel.text = @"Follow Us";
    }
    else if (indexPath.row==3) {
        
        cell.textLabel.text = @"Linked In";
        cell.detailTextLabel.text = @"Follow Us";
    }
    
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHWebBrowser *browser = [JHWebBrowser new];

    browser.showTitleBar = NO;
    browser.showAddressBar = NO;
    browser.showToolbar = NO;
    
    if (indexPath.row==0) {
       browser.url = [NSURL URLWithString:@"http://www.facebook.com/tcs"];
    }
    else if (indexPath.row==1) {
      browser.url = [NSURL URLWithString:@"http://www.youtube.com/apple"];
    }
    else if (indexPath.row==2) {
        browser.url = [NSURL URLWithString:@"http://www.twitter.com/tcs"];
    }
    else if (indexPath.row==3) {
        browser.url = [NSURL URLWithString:@"http://www.wipro.com"];
    }
    
    [self.navigationController pushViewController:browser animated:YES];
}



@end
