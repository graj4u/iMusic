//
//  GRFirstViewController.m
//  MyMusicApp
//


#import "GRFirstViewController.h"

@interface GRFirstViewController ()
@property (nonatomic, retain) NSArray *names;
@end

@implementation GRFirstViewController

@synthesize gridView, gridViewCellContent, names,currentSelection;

- (void)viewDidLoad
{
	
	self.names = [NSArray arrayWithObjects:
				  @"Siren.mp3",
				  @"Siren1.mp3",
				  @"Siren.mp3",
				  @"Siren1.mp3",
				  @"Siren.mp3",
				  @"Siren1.mp3",
				  @"Siren.mp3",
				  @"Siren1.mp3",
				  @"Siren.mp3",
				  @"Siren1.mp3",
				  @"Siren.mp3",
				  @"Siren1.mp3",
				  @"Siren.mp3",
				  @"Siren1.mp3",
				  @"Siren.mp3",
				  @"Siren1.mp3",
				  @"Siren.mp3",
				  @"Siren1.mp3",
				  nil];
	
    self.gridView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.png"]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background2.png"]];
    
    [self.playStopButton setBackgroundImage:[UIImage imageNamed:@"play-icon.png"] forState:UIControlStateNormal];
    
    self.currentSelection = 0;
    
	gridView.dataSource = self;
    gridView.delegate = self;
	[gridView reloadData];
    
    [_playControlBoard.layer setCornerRadius:10.0f];
    [_playControlBoard.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_playControlBoard.layer setBorderWidth:1.5f];
    [_playControlBoard.layer setShadowColor:[UIColor blackColor].CGColor];
    [_playControlBoard.layer setShadowOpacity:0.8];
    [_playControlBoard.layer setShadowRadius:3.0];
    [_playControlBoard.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
}

- (NSUInteger)numberOfItemsInGridView:(AQGridView *)aGridView
{
    return [names count];
}

- (AQGridViewCell *)gridView:(AQGridView *)aGridView cellForItemAtIndex:(NSUInteger)index
{
	static NSString *CellIdentifier = @"ReusableGridViewCell";
	
	AQGridViewCell *cell = (AQGridViewCell *)[gridView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil)
	{
		[[NSBundle mainBundle] loadNibNamed:@"ReusableGridViewCell" owner:self options:nil];
        
		cell = [[[AQGridViewCell alloc] initWithFrame:gridViewCellContent.frame
									  reuseIdentifier:CellIdentifier] autorelease];
		[cell.contentView addSubview:gridViewCellContent];
		
		cell.selectionStyle = AQGridViewCellSelectionStyleNone;
	}
	
	ReusableGridViewCell *content = (ReusableGridViewCell *)[cell.contentView viewWithTag:1];
	NSString *name = [names objectAtIndex:index];
    
	//NSString *imageName = [[name lowercaseString] stringByAppendingString:@".gif"];
	//content.imageView.image = [UIImage imageNamed:imageName];
    
	content.textLabel.text = name;
    
    
	return cell;
}

- (CGSize)portraitGridCellSizeForGridView:(AQGridView *)aGridView
{
	[[NSBundle mainBundle] loadNibNamed:@"ReusableGridViewCell" owner:self options:nil];
	return gridViewCellContent.frame.size;
}

-(void)gridView:(AQGridView *)gridView didSelectItemAtIndex:(NSUInteger)index {
    NSLog (@"Selected theArgument=%d\n", index);
    
    [self audioInit:[self.names objectAtIndex:index]];
    
    
}

- (void)dealloc
{
    [audioPlayer release];
	[gridView release];
	[gridViewCellContent release];
	[names release];
    [_loop release];
    [_playAll release];
    [_background release];
    [_backButton release];
    [_playStopButton release];
    [_forwardButton release];
    [_musicProgressSlider release];
    [_sliderTimer release];
    [super dealloc];
}

- (IBAction)loopButtonPressed:(id)sender {
    
    [self.loop setBackgroundImage:[UIImage imageNamed:@"tb-33.png"] forState:UIControlStateNormal];
    [self.playAll setBackgroundImage:[UIImage imageNamed:@"tb-11.png"] forState:UIControlStateNormal];
    [self.background setBackgroundImage:[UIImage imageNamed:@"tb-1.png"] forState:UIControlStateNormal];
    
    [self.loop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.playAll setTitleColor:[UIColor scrollViewTexturedBackgroundColor] forState:UIControlStateNormal];
    [self.background setTitleColor:[UIColor scrollViewTexturedBackgroundColor] forState:UIControlStateNormal];
    
    
    
}

- (IBAction)playAllButtonPressed:(id)sender {
    
    [self.loop setBackgroundImage:[UIImage imageNamed:@"tb-11.png"] forState:UIControlStateNormal];
    [self.playAll setBackgroundImage:[UIImage imageNamed:@"tb-33.png"] forState:UIControlStateNormal];
    [self.background setBackgroundImage:[UIImage imageNamed:@"tb-1.png"] forState:UIControlStateNormal];
    
    [self.loop setTitleColor:[UIColor scrollViewTexturedBackgroundColor] forState:UIControlStateNormal];
    [self.playAll setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.background setTitleColor:[UIColor scrollViewTexturedBackgroundColor] forState:UIControlStateNormal];
    
    
    
}

- (IBAction)backgroundButtonPressed:(id)sender {
    
    [self.loop setBackgroundImage:[UIImage imageNamed:@"tb-11.png"] forState:UIControlStateNormal];
    [self.playAll setBackgroundImage:[UIImage imageNamed:@"tb-11.png"] forState:UIControlStateNormal];
    [self.background setBackgroundImage:[UIImage imageNamed:@"tb-3.png"] forState:UIControlStateNormal];
    
    [self.loop setTitleColor:[UIColor scrollViewTexturedBackgroundColor] forState:UIControlStateNormal];
    [self.playAll setTitleColor:[UIColor scrollViewTexturedBackgroundColor] forState:UIControlStateNormal];
    [self.background setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
}

- (IBAction)BackButtonPressed:(UIButton *)sender {
    
    
}

- (IBAction)playStopButtonPressed:(UIButton *)sender  {
    
     
    if (sender.tag == 0) {
        
        [self audioInit:[self.names objectAtIndex:self.currentSelection]];
        
        [self.playStopButton setBackgroundImage:[UIImage imageNamed:@"pause-icon.png"] forState:UIControlStateNormal];
        [self.playStopButton setTag:1];
        
    }
    else {
         [self.playStopButton setBackgroundImage:[UIImage imageNamed:@"play-icon.png"] forState:UIControlStateNormal];
         [audioPlayer pause];
        [self.playStopButton setTag:0];
    }
    
     
    
}

- (IBAction)forwardButtonPressed:(id)sender {
    
    
    
}
#pragma mark -
#pragma mark nextSongs


-(IBAction)playNextSong:(id)sender {
    
   //  NSLog(@"playNextSong-->%d",self.currentSelection);
    
    if([self.names count] > 0){
    
        if(self.currentSelection < [self.names count]-1){
            self.currentSelection ++;
            // [audioPlayer stop];
           [self audioInit:[self.names objectAtIndex:self.currentSelection]];
         
            
        }
        else{
            self.currentSelection = [self.names count];
           
        }
        
    }
    
}

#pragma mark -
#pragma mark previousSong

-(IBAction)playPreviousSong:(id)sender {
    
   // NSLog(@"playPreviousSong-->%d",self.currentSelection);
    
    if([self.names count] > 0){
        if (self.currentSelection > 0) {
            
            self.currentSelection -- ;
            //[audioPlayer stop];
            
            [self audioInit:[self.names objectAtIndex:self.currentSelection]];
        }
        else
        {
             self.currentSelection = 0;
            return;
        }
       
    }
    
    
}




-(void)audioInit:(NSString *)fName {
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],fName]];
    
	NSLog(@"Audio file url:%@",url);
    if (audioPlayer != nil){
        
        [audioPlayer release];
        audioPlayer=nil;

    }
    
	NSError *error;
    if (audioPlayer == nil){
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    }
    else {
        [audioPlayer stop];
    }
    
    
    [audioPlayer setVolume:1.0];// Set Voloumn
	audioPlayer.numberOfLoops = -1;
    
	if (audioPlayer == nil)
        
		NSLog(@"Error!%@",[error description]);
    
	else{
        
        // Sets a timer which kgets the current sound time and updates the UISlider in 1 sec intervals
        _sliderTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateSlider) userInfo:nil repeats:YES];
        // Sets the maximum value of the UISlider
        _musicProgressSlider.maximumValue = audioPlayer.duration;
        // Sets the valueChanged target
        [_musicProgressSlider addTarget:self action:@selector(sliderChanged : ) forControlEvents : UIControlEventValueChanged];
        audioPlayer.delegate=self;
        // Play the audio
        [audioPlayer prepareToPlay];
        [audioPlayer play];
        
		//[audioPlayer play];
    }
    
    // Extra Methods
    //audioPlayer.volume = 0.5; // 0.0 - no volume; 1.0 full volume
    //NSLog(@"%f seconds played so far", audioPlayer.currentTime);
    //audioPlayer.currentTime = 10; // jump to the 10 second mark
    //[audioPlayer pause];
    //[audioPlayer stop]; // Does not reset currentTime; sending play resumes
}


- (void)updateSlider {
    // Updates the slider about the music time
    _musicProgressSlider.value = audioPlayer.currentTime;
    
}

- (IBAction)sliderChanged : (UISlider *)sender {
    
    // Fast skips the music when user scrolls the UISlider
    [audioPlayer stop];
    [audioPlayer setCurrentTime:_musicProgressSlider.value];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}

// Stops the timer when the music is finished
- (void)audioPlayerDidFinishPlaying : (AVAudioPlayer *)player successfully : (BOOL)flag {
    // Music completed
    if (flag) {
        
        [_sliderTimer invalidate];
    }
}


@end