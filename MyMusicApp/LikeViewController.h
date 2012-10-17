//
//  LikeViewController.h
//  MyMusicApp
//
//  Created by Gaurav Raj on 9/27/12.
//  Copyright (c) 2012 GRaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHWebBrowser.h"

@interface LikeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *myTableView;

@end
