//
//  AppDelegate.h
//  Memory
//
//  Created by marian samy on 3/30/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    AVAudioPlayer *player;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AVAudioPlayer *player;
@end

