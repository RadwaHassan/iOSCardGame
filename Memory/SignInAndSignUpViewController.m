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
    NSNumber *check;
    id senderBtn;
    NSUserDefaults *defaults;
}

@synthesize signinButton , signupButton , username ,password;


- (void)viewDidLoad
{
    [super viewDidLoad];
    defaults = [NSUserDefaults standardUserDefaults];

    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"radwa1.jpg"]]];
    //[self.navigationController.navigationBar setTintColor:[UIColor blueColor]];
   // self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:194.0f/255.0f green:235.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    
   

    // Do any additional setup after loading the view, typically from a nib.
    
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
//    if (defaults!=nil) {
//  
//    if (([myUsername isEqual:[defaults valueForKey:@"phone"]])&&([myPassword isEqual:[defaults valueForKey:@"password"]])) {
//        
//        
//        
//    }}
   // [[self.navigationController.navigationBar appearance] setBarTintColor:[UIColor blueColor]];
   // self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:117/255.0f green:4/255.0f blue:32/255.0f alpha:1];
   // [[UINavigationBar appearance] setBarTintColor:[UIColor greenColor]];

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

            NSString *final=[NSString stringWithFormat:@"http://10.145.17.224:8084/IosCardGameServer/Login?email=%@&password=%@",userName,password];
            NSURL *url=[[NSURL alloc]initWithString:final];
            NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url];
            NSURLConnection *connection=[[NSURLConnection alloc]initWithRequest:request delegate:self];
            [connection start];
    
    //[self performSegueWithIdentifier:@"logInSuccess" sender:senderBtn];
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
        
         myUsername = [username text];
        [defaults setValue:myUsername forKey:@"username"];
        
        myPassword = [password text];
        [defaults setValue:myPassword forKey:@"password"];
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
