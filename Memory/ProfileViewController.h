//
//  ProfileViewController.h
//  Memory
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

@property IBOutlet UIImageView *profileImage;
@property IBOutlet UILabel *profileNameLabel;
@property IBOutlet UITextField *profileNameTxtField;
@property IBOutlet UIButton *changeNameBtn1;
@property IBOutlet UIButton *changeImageBtn;
-(IBAction)changeNamePressed:(id)sender;
-(IBAction)changeImagePressed:(id)sender;

@end
