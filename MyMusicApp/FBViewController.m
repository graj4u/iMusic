//
//  FBViewController.m
//  MyMusicApp
//
//  Created by Gaurav Raj on 9/27/12.
//  Copyright (c) 2012 GRaj. All rights reserved.
//

#import "FBViewController.h"

@interface FBViewController ()

@end

@implementation FBViewController

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
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        // Device is able to send a Twitter message
        
        SLComposeViewController *composeController = [SLComposeViewController
                                                      composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [composeController setInitialText:@"Just found this great way to intregate this"];
        //[composeController addImage:postImage.image];
        [composeController addURL: [NSURL URLWithString:
                                    @"http://www.gauravraj.com"]];
        
        [composeController setCompletionHandler:[self setComplitionHandlerFunction]];
        
        [self presentViewController:composeController
                           animated:YES completion:nil];
        
        
    }
}

-(id) setComplitionHandlerFunction
{
    SLComposeViewControllerCompletionHandler resultFB = ^(SLComposeViewControllerResult result) {
        NSString *output;
        
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"ACtionCancelled";
                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                break;
            default:
                break;
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook Complition Message"
                                                        message:output
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        
        [alert show];
        [alert release];
    };
    
    return resultFB;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
