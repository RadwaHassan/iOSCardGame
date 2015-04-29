//
//  splashScreenViewController.h
//  Memory
//
//  Created by JETS on 4/13/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface splashScreenViewController : UIViewController
@property (nonatomic,strong) UIDynamicAnimator *animator;
@property (nonatomic,strong) UIView *firstView;
//@property (weak, nonatomic) IBOutlet UIImageView *bottom_img;

-(void) gravity;
@property (strong, nonatomic) IBOutlet UIImageView *bachground;
@property (strong, nonatomic) IBOutlet UITabBar *tabBar;
@property (strong, nonatomic) IBOutlet UIImageView *top_img;


@end
