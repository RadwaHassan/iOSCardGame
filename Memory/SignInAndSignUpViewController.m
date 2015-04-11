//
//  SignInAndSignUpViewController.m
//  Memory
//
//  Created by marian samy on 4/4/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import "SignInAndSignUpViewController.h"
#import "HomeScreenViewController.h"
@interface SignInAndSignUpViewController ()

@end

@implementation SignInAndSignUpViewController{
    NSString *myUsername;
    NSString *myPassword;
    NSUserDefaults *defaults;
    NSNumber *check;
    id senderBtn;
}

@synthesize signinButton , signupButton , username ,password;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"radwa1.jpg"]]];
    // Do any additional setup after loading the view, typically from a nib.
    defaults = [NSUserDefaults standardUserDefaults];
    
    [signinButton setBackgroundColor:[UIColor purpleColor]];
    //[signupButton setBackgroundColor:[UIColor purpleColor]];
    signinButton.layer.cornerRadius = 10.0;
    //signupButton.layer.cornerRadius = 10.0;
    //sarah
    //[username setBorderStyle:UITextBorderStyleNone];
    username.layer.cornerRadius = 10.0;
    username.layer.borderColor = [UIColor purpleColor].CGColor;
    username.layer.borderWidth = 1.0;
    
    //[password setBorderStyle:UITextBorderStyleNone];
    password.layer.cornerRadius = 10.0;
    password.layer.borderColor = [UIColor purpleColor].CGColor;
    password.layer.borderWidth = 1.0;
    
    //if defaults still have values and not logged out
    if (defaults!=nil) {
  
    if (([myUsername isEqual:[defaults valueForKey:@"phone"]])&&([myPassword isEqual:[defaults valueForKey:@"password"]])) {
        
        
        
    }}

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)signIn:(id)sender{
    myUsername = [username text];
    myPassword = [password text];

            NSString *userName=myUsername ;

            NSString *password=myPassword;

            NSString *final=[NSString stringWithFormat:@"http://192.168.1.10:8084/IosCardGameServer/Login?email=%@&password=%@",userName,password];
            NSURL *url=[[NSURL alloc]initWithString:final];
            NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url];
            NSURLConnection *connection=[[NSURLConnection alloc]initWithRequest:request delegate:self];
            [connection start];

    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    printf("did receive data ");
    //Login code
    NSMutableDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSNumber *state=[dic objectForKey:@"Status"];
    NSLog(@"+++++++ %d" ,[state intValue]);
    check=state;
    if([state intValue] == 1 ){
        NSNumber *score=[dic objectForKey:@"Score"];
           [self performSegueWithIdentifier:@"logInSuccess" sender:senderBtn];
    }
    else{
        [username setText:@""];
        [password setText:@""];
        UIAlertView *alert2=[[UIAlertView alloc]initWithTitle:@"Status" message:@"Failed to login !" delegate:self cancelButtonTitle:@"Try again" otherButtonTitles:nil];
        [alert2 show];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    if ([[segue identifier] isEqualToString:@"logInSuccess"]) {
     
            myUsername = [username text];
            [defaults setValue:myUsername forKey:@"username"];
            
            myPassword = [password text];
            [defaults setValue:myPassword forKey:@"password"];
            
            
            HomeScreenViewController *homeScreen = [segue destinationViewController];
            homeScreen.userName=myUsername;
    }
}




- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString: @"login"]) {
            if ([check intValue] == 1) {
                return YES;
            }
            else{
                return NO;
            }
        
    }
    else{
        return YES;
    }

}


@end
