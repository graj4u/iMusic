//
//  GRFirstViewController.h
//  MyMusicApp
//
//  Created by Gaurav Raj on 9/25/12.
//  Copyright (c) 2012 GRaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AQGridView.h"
#import "ReusableGridViewCell.h"

@interface GRFirstViewController : UIViewController <AQGridViewDataSource,AQGridViewDelegate> {
    AVAudioPlayer* audioPlayer;
}

@property (nonatomic, retain) IBOutlet AQGridView *gridView;
@property (nonatomic, retain) IBOutlet ReusableGridViewCell *gridViewCellContent;
@property (retain, nonatomic) IBOutlet UIButton *loop;
@property (retain, nonatomic) IBOutlet UIButton *playAll;
@property (retain, nonatomic) IBOutlet UIButton *background;

- (IBAction)loopButtonPressed:(id)sender;
- (IBAction)playAllButtonPressed:(id)sender;
- (IBAction)backgroundButtonPressed:(id)sender;

-(void)audioInit:(NSString *)fName;

@end
