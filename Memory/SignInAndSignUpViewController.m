//
//  SignInAndSignUpViewController.m
//  Memory
//
//  Created by marian samy on 4/4/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import "SignInAndSignUpViewController.h"

@interface SignInAndSignUpViewController ()

@end

@implementation SignInAndSignUpViewController

@synthesize signinButton , signupButton , username ,password;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [signinButton setBackgroundColor:[UIColor purpleColor]];
    [signupButton setBackgroundColor:[UIColor purpleColor]];
    signinButton.layer.cornerRadius = 10.0;
    signupButton.layer.cornerRadius = 10.0;
    
    [username setBorderStyle:UITextBorderStyleNone];
    username.layer.cornerRadius = 10.0;
    username.layer.borderColor = [UIColor purpleColor].CGColor;
    username.layer.borderWidth = 1.0;
    
    [password setBorderStyle:UITextBorderStyleNone];
    password.layer.cornerRadius = 10.0;
    password.layer.borderColor = [UIColor purpleColor].CGColor;
    password.layer.borderWidth = 1.0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)signInButton:(id)sender{
    
}
-(IBAction)signUpButton:(id)sender{
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
