//
//  TWViewController.m
//  MyMusicApp
//
//  Created by Gaurav Raj on 9/27/12.
//  Copyright (c) 2012 GRaj. All rights reserved.
//

#import "TWViewController.h"

@interface TWViewController ()

@end

@implementation TWViewController

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

-(void)viewWillAppear:(BOOL)animated
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        // Device is able to send a Twitter message
        
        SLComposeViewController *composeController = [SLComposeViewController
                                                      composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [composeController setInitialText:@"Just found this great way to intregate this"];
        //[composeController addImage:postImage.image];
        [composeController addURL: [NSURL URLWithString:
                                    @"http://www.gauravraj.com"]];
        
        [self presentViewController:composeController
                           animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
