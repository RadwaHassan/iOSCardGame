//
//  SignUpViewController.h
//  Memory
//
//  Created by JETS on 4/8/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *signupUsername;
@property (strong, nonatomic) IBOutlet UITextField *signupPassword;
@property (strong, nonatomic) IBOutlet UITextField *signupEmail;
@property (strong, nonatomic) IBOutlet UITextField *signupConfirmPassword;
@property (strong, nonatomic) IBOutlet UIButton *signupBtn;
-(IBAction)signupPressed:(id)sender;

@end
