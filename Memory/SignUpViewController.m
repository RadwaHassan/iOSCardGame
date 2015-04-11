//
//  SignUpViewController.m
//  Memory
//
//  Created by JETS on 4/8/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController
@synthesize signupBtn,signupConfirmPassword,signupEmail,signupPassword,signupUsername;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"radwa2.jpg"]]];

    signupUsername.layer.cornerRadius = 10.0;
    signupUsername.layer.borderColor = [UIColor purpleColor].CGColor;
    signupUsername.layer.borderWidth = 1.0;
    
    signupEmail.layer.cornerRadius = 10.0;
    signupEmail.layer.borderColor = [UIColor purpleColor].CGColor;
    signupEmail.layer.borderWidth = 1.0;
    
    signupPassword.layer.cornerRadius = 10.0;
    signupPassword.layer.borderColor = [UIColor purpleColor].CGColor;
    signupPassword.layer.borderWidth = 1.0;
    
    //[signupConfirmPassword setBorderStyle:UITextBorderStyleNone];
    signupConfirmPassword.layer.cornerRadius = 10.0;
    signupConfirmPassword.layer.borderColor = [UIColor purpleColor].CGColor;
    signupConfirmPassword.layer.borderWidth = 1.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)signupPressed:(id)sender{
    NSString *str1=[signupUsername text];
    NSString *str2=[signupEmail text];
    NSString *str3=[signupPassword text];
    
    //http://localhost:8084/IosWebDemo/SignUP?name=moh&email=moh&password=ss virtual cann't use local host as ip
    
    
    //printf("++++%s" , [str UTF8String]);
    NSString *final=[NSString stringWithFormat:@"http://192.168.1.13:8084/IosCardGameServer/SignUP?email=%@&name=%@&password=%@",str1,str2,str3];
    
    NSURL *url=[[NSURL alloc]initWithString:final];
    
    
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url];
    
    
    NSURLConnection *connection=[[NSURLConnection alloc]initWithRequest:request delegate:self];
    [connection start];
    
    //redirect to signIn view when signUp is successful
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    printf("did receive data ");
    //Login code
    NSMutableDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSNumber *state=[dic objectForKey:@"Status"];
    NSLog(@"+++++++ %d" ,[state intValue]);
    
    if([state intValue] == 1 ){
        NSNumber *score=[dic objectForKey:@"Score"];
        NSLog(@"+++++++ %d" ,[score intValue]);
       // [scoreLabel setText:[NSString stringWithFormat:@"%@", score]];
        UIAlertView *alertLogin=[[UIAlertView alloc]initWithTitle:@"Status" message:@"Logined successfully !" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"Ok", nil];
        [alertLogin show];
        
    }
    else{
        UIAlertView *alert2=[[UIAlertView alloc]initWithTitle:@"Status" message:@"Failed to login !" delegate:self cancelButtonTitle:@"Try again" otherButtonTitles:@"Ok", nil];
        [alert2 show];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"login"]) {
        NSLog(@"in if");
        //        id object = [_objects objectAtIndex:_ipth.row];
        //        [[segue destinationViewController] setDetailItem:object];
        //save data in NSDefault after SignUp
//        myUsername = [username text];
//        [defaults setValue:myUsername forKey:@"username"];
//        
//        myPassword = [password text];
//        [defaults setValue:myPassword forKey:@"password"];
//        
//        NSString *str1=myUsername ;
//        NSString *str2=myPassword;
//        NSString *final=[NSString stringWithFormat:@"http://10.145.10.162:8084/IosCardGameServer/Login?email=%@&password=%@",str1,str2];
//        NSURL *url=[[NSURL alloc]initWithString:final];
//        NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url];
//        NSURLConnection *connection=[[NSURLConnection alloc]initWithRequest:request delegate:self];
//        [connection start];
//        
//        
//        HomeScreenViewController *homeScreen = [segue destinationViewController];
//        homeScreen.userName=myUsername;
        
        
    }
}
@end
