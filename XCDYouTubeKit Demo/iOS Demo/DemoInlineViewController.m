//
//  Copyright (c) 2013-2014 Cédric Luthi. All rights reserved.
//

#import "DemoInlineViewController.h"

@interface DemoInlineViewController ()

@property (nonatomic, strong) XCDYouTubeVideoPlayerViewController *videoPlayerViewController;

@end

@implementation DemoInlineViewController

- (void) viewWillDisappear:(BOOL)animated
{
	// Beware, viewWillDisappear: is called when the player view enters full screen on iOS 6+
	if ([self isMovingFromParentViewController])
		[self.videoPlayerViewController.moviePlayer stop];
}

- (IBAction) load:(id)sender
{
	[self.videoContainerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
	
	self.videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"VpZmIiIXuZ0"];
	self.videoPlayerViewController.moviePlayer.backgroundPlaybackEnabled = [[NSUserDefaults standardUserDefaults] boolForKey:@"PlayVideoInBackground"];
	[self.videoPlayerViewController presentInView:self.videoContainerView];
	
	if (self.prepareToPlaySwitch.on)
		[self.videoPlayerViewController.moviePlayer prepareToPlay];
	
	self.videoPlayerViewController.moviePlayer.shouldAutoplay = self.shouldAutoplaySwitch.on;
}

- (IBAction) prepareToPlay:(UISwitch *)sender
{
	if (sender.on)
		[self.videoPlayerViewController.moviePlayer prepareToPlay];
}

@end
