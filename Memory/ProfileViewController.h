//
//  ProfileViewController.h
//  Memory
//
//  Created by JETS on 4/5/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUser.h"
@interface ProfileViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property IBOutlet UIImageView *profileImage;
@property IBOutlet UILabel *profileNameLabel;
@property IBOutlet UITextField *profileNameTxtField;
@property IBOutlet UIButton *changeNameBtn1;
@property IBOutlet UIButton *changeImageBtn;
@property IBOutlet UIBarButtonItem *profileSaveBtn;
@property UIImage *userImage;
@property NSString *username;

@property MyUser *user;
-(IBAction)changeNamePressed:(id)sender;
-(IBAction)changeImagePressed:(id)sender;
-(IBAction)saveProfile:(id)sender;
- (MyUser *)loadUser;


@end
