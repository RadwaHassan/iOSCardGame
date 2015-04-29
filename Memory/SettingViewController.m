//
//  SettingViewController.m
//  Memory
//
//  Created by marian samy on 4/4/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import "SettingViewController.h"
#import "HomeScreenViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController
@synthesize soundSwitch;
@synthesize bkgndSoundSwitch;
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
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"radwa2.jpg"]]];

    // Do any additional setup after loading the view.
}


-(void)bckgndSoundSwitch:(id)sender{
    if (soundSwitch.on) {
        //sound enabled
        printf("enabled");
        [HomeScreenViewController startBGMusic];
        
    }else{
        //sound disabled
        [HomeScreenViewController stopBGMusic];
       // [HomeScreenViewController setFlagbkgndSound:0];
    }
    printf("not here or here");
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)soundSwitch:(id)sender{
    if (soundSwitch.on) {
        //sound enabled
        printf("enabled");
        
    }else{
        //sound disabled
        [HomeScreenViewController setFlagSound:0 ];
    }
    printf("not here or here");
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
