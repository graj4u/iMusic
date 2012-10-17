//
//  GRFirstViewController.h
//  MyMusicApp
//


#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AQGridView.h"
#import "ReusableGridViewCell.h"

@interface GRFirstViewController : UIViewController <AQGridViewDataSource,AQGridViewDelegate,AVAudioPlayerDelegate> {
    AVAudioPlayer* audioPlayer;
    int currentSelection;
}

@property (nonatomic, retain) IBOutlet AQGridView *gridView;
@property (nonatomic, retain) IBOutlet ReusableGridViewCell *gridViewCellContent;
@property (retain, nonatomic) IBOutlet UIButton *loop;
@property (retain, nonatomic) IBOutlet UIButton *playAll;
@property (retain, nonatomic) IBOutlet UIButton *background;
@property (retain, nonatomic) IBOutlet UIButton *backButton;
@property (retain, nonatomic) IBOutlet UIButton *playStopButton;
@property (retain, nonatomic) IBOutlet UIButton *forwardButton;
@property (retain, nonatomic) IBOutlet UISlider *musicProgressSlider;
@property (retain, nonatomic) IBOutlet NSTimer *sliderTimer;
@property (nonatomic,assign)int currentSelection;
- (IBAction)loopButtonPressed:(id)sender;
- (IBAction)playAllButtonPressed:(id)sender;
- (IBAction)backgroundButtonPressed:(id)sender;
- (IBAction)BackButtonPressed:(id)sender;
- (IBAction)playStopButtonPressed:(id)sender;
- (IBAction)forwardButtonPressed:(id)sender;

-(void)audioInit:(NSString *)fName;
-(IBAction)playNextSong:(id)sender;
-(IBAction)playPreviousSong:(id)sender;

@end
