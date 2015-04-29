//
//  HomeScreenViewController.h
//  Memory
//
//  Created by marian samy on 4/4/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "MyUser.h"

@interface HomeScreenViewController : UIViewController
//@property (strong, nonatomic) AVAudioPlayer *player;
@property IBOutlet UIBarButtonItem *profileIconbtn;
@property IBOutlet UILabel *homeName;
@property NSString *userName;
+(int)flagSound;
+(void)setFlagSound:(int)myFlag;
//- (void)saveUser:(MyUser *)user;
+(int)flagbkgndSound;
+(void)setFlagbkgndSound:(int)myFlag;
+(void)stopBGMusic;
+(void)startBGMusic;

@end
