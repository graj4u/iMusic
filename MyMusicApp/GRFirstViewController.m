//
//  GRFirstViewController.m
//  MyMusicApp
//
//  Created by Gaurav Raj on 9/25/12.
//  Copyright (c) 2012 GRaj. All rights reserved.
//

#import "GRFirstViewController.h"

@interface GRFirstViewController ()
@property (nonatomic, retain) NSArray *names;
@end

@implementation GRFirstViewController

@synthesize gridView, gridViewCellContent, names;

- (void)viewDidLoad
{
	
	self.names = [NSArray arrayWithObjects:
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  @"Siren",
				  nil];
	
    self.gridView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background1.png"]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background2.png"]];
    
	gridView.dataSource = self;
    gridView.delegate = self;
	[gridView reloadData];
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
    [_musicProgressView release];
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

- (IBAction)BackButtonPressed:(id)sender {
}

- (IBAction)playStopButtonPressed:(id)sender {
}

- (IBAction)forwardButtonPressed:(id)sender {
}

-(void)audioInit:(NSString *)fName
{
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Siren.mp3", [[NSBundle mainBundle] resourcePath]]];
	NSLog(@"Audio file url:%@",url);
	NSError *error;
    if (audioPlayer == nil){
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    } else {
        [audioPlayer stop];
    }
    
	audioPlayer.numberOfLoops = -1;
    
	if (audioPlayer == nil)
		NSLog(@"Error!%@",[error description]);
	else
		[audioPlayer play];
    
    // Extra Methods
    //audioPlayer.volume = 0.5; // 0.0 - no volume; 1.0 full volume
    //NSLog(@"%f seconds played so far", audioPlayer.currentTime);
    //audioPlayer.currentTime = 10; // jump to the 10 second mark
    //[audioPlayer pause];
    //[audioPlayer stop]; // Does not reset currentTime; sending play resumes
}



@end