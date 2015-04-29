//
//  HomeScreenViewController.m
//  Memory
//
//  Created by marian samy on 4/4/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "ViewController.h"
#import "ProfileViewController.h"
@interface HomeScreenViewController (){
    ProfileViewController *profile;
    MyUser *loadUserinfo;
}

@end
static int flagSound=1;
static int flagbkgndSound=1;
static AVAudioPlayer *player=nil;
@implementation HomeScreenViewController

@synthesize profileIconbtn,homeName,userName;


+(int)flagbkgndSound{
    return flagbkgndSound;
}

+(void)setFlagbkgndSound:(int)myFlag{
    flagbkgndSound=myFlag;
}

+(int)flagSound{
    return flagSound;
}

+(void)setFlagSound:(int)myFlag{
    flagSound=myFlag;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
   // loadUserinfo=[self loadUser];
   // [profile setUser:loadUserinfo];
    
    UIImage *img = [UIImage imageNamed:@"profile.png"];
    //    CGRect frameimg = CGRectMake(0, 0, img.size.width, img.size.height);
    //    UIButton *btn = [[UIButton alloc] initWithFrame:frameimg];
    //    [btn setBackgroundImage:img forState:UIControlStateNormal];
    //    profileIconbtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [profileIconbtn setBackgroundImage:img forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

        // [profileImage setImage:selectedImage];
//    profile=[ProfileViewController new];
//
//    MyUser *ffuser= [MyUser new];
//    ffuser= [profile loadUser];
//    [profile setUsername:[ffuser name]];
//        //
//        NSData * imageData=[ffuser fImage];
//    [profile setUserImage:[UIImage imageWithData:imageData]];
    
        //convert the nsdata to uiimage to put it on image view
       // UIImage *usersavedImage=[UIImage imageWithData:imageData];
        
      //  [profileNameTxtField setText:name];
       // [profileImage setImage:usersavedImage];
        
        
        
    

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [HomeScreenViewController startBGMusic];
    // Do any additional setup after loading the view.
    NSLog(userName);
    self.homeName.text=@"";
    //self.navigationController.navigationBar.topItem.title = userName;
    [self setTitle:[NSString stringWithFormat:@"Welcome %@",userName]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"radwa2.jpg"]]];

    [self.navigationController setTitle:@"Home"];
//    NSString *soundFilePath = [NSString stringWithFormat:@"%@/%@.mp3",
//                               [[NSBundle mainBundle] resourcePath], @"main_tone"];
//    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
//    
//    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
//                                                     error:nil];
//    _player.numberOfLoops = 10;
//    
//    [_player play];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"game_segue"]) {
        
        ViewController *gameScreen = [segue destinationViewController];
        gameScreen.userName=self.userName;
    }
    
    if ([[segue identifier] isEqualToString:@"logout"]) {
        
       // [self.navigationController popToRootViewControllerAnimated:YES];
        NSUserDefaults *def=[NSUserDefaults new];
        [def setObject:nil forKey:@"username"];
    }
    if ([[segue identifier] isEqualToString:@"setting_segue"]) {
        
    }
}

+(void)startBGMusic{
    NSString *soundFilePath = [NSString stringWithFormat:@"%@/%@.mp3",
                               [[NSBundle mainBundle] resourcePath], @"main_tone"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                     error:nil];
    player.numberOfLoops = 10;
    
    [player play];

}

+(void)stopBGMusic{
//    NSString *soundFilePath = [NSString stringWithFormat:@"%@/%@.mp3",
//                               [[NSBundle mainBundle] resourcePath], @"main_tone"];
//    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
//    
//    player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
//                                                    error:nil];
//    player.numberOfLoops = 10;
    
    [player stop];
    
}






@end
