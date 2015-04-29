//
//  ViewController.h
//  Memory
//
//  Created by marian samy on 3/30/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <Social/Social.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) AVAudioPlayer *player;

@property ( nonatomic,strong) IBOutletCollection(UIButton) NSArray *cardsButtonsArray;

@property (strong,nonatomic) NSMutableArray *cardsImages;
@property IBOutlet UILabel *scoreLable;
@property IBOutlet UILabel *timerLabel;
@property NSInteger score;
@property NSInteger seconds;
@property NSInteger cardMatchedCounter;

@property NSTimer *timer;
@property NSString *firstClick;
@property UIButton *firstClickButton;

@property NSString *secondClick;
@property UIButton *secondClickButton;

@property NSString *userName;


@property BOOL touchOK;
@property SLComposeViewController *mySLComposerSheet;



-(IBAction)cardClicked:(id)sender;
-(IBAction)pauseButtonClicked:(id)sender;

- (void)setupGame;
- (void)subtractTime;

@end



