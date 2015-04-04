//
//  ViewController.h
//  Memory
//
//  Created by marian samy on 3/30/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property ( nonatomic,strong) IBOutletCollection(UIButton) NSArray *cardsButtonsArray;

@property (strong,nonatomic) NSMutableArray *cardsImages;

@property IBOutlet UILabel *scoreLable;
@property IBOutlet UILabel *timerLabel;
@property NSInteger score;
@property NSInteger seconds;

@property NSTimer *timer; //ADD THIS!!
@property NSString *firstClick;
@property UIButton *firstClickButton;

@property NSString *secondClick;
@property UIButton *secondClickButton;



@property BOOL touchOK;



-(IBAction)cardClicked:(id)sender;
- (void)setupGame;
- (void)subtractTime;

@end



