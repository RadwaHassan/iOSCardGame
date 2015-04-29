//
//  splashScreenViewController.m
//  Memory
//
//  Created by JETS on 4/13/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import "splashScreenViewController.h"

@interface splashScreenViewController (){
    NSString *name;
}

@end

@implementation splashScreenViewController
@synthesize top_img ;

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
    
    [self performSelector:@selector(goToNextView) withObject:nil afterDelay:4];
}

-(void)goToNextView{
    if(name ==  nil){
    [self performSegueWithIdentifier:@"nextSegue" sender:self];
    }else{
      //  [self performSegueWithIdentifier:@"homeSegue" sender:self];
[self performSegueWithIdentifier:@"nextSegue" sender:self];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    
    self.firstView =[[UIView alloc] initWithFrame:CGRectMake(75, 75, 190, 190)];
    UIImage *img = [UIImage imageNamed:@"game_text.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.frame = self.firstView.bounds;
    [self.firstView addSubview:imgView];
    
    [self.view addSubview:self.firstView];
    self.animator =[[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    [self gravity];
    
    CGRect topFrame = self.top_img.frame;
    topFrame.origin.y = topFrame.size.height-700;
    
    CGRect bottomFrame = self.tabBar.frame;
    bottomFrame.origin.y= self.view.bounds.size.height;
    
    [UIView animateWithDuration:2.0
                          delay:2.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.top_img.frame = topFrame;
                         self.tabBar.frame = bottomFrame;
                     }
                     completion:^(BOOL finished){
                         // NSLog(@"Done!");
                     }];
    NSUserDefaults *user =[NSUserDefaults new];
   name=[user valueForKey:@"username"];
    
}

-(void)gravity{
    UIGravityBehavior *ballGravity = [[UIGravityBehavior alloc] initWithItems:@[self.firstView]];
    [self.animator addBehavior:ballGravity];
    
    
    UICollisionBehavior *collision =[[UICollisionBehavior alloc] initWithItems:@[self.firstView]];
    [collision addBoundaryWithIdentifier:@"tabBar" fromPoint:self.tabBar.frame.origin toPoint:CGPointMake(self.tabBar.frame.origin.x+self.tabBar.frame.size.width, self.tabBar.frame.origin.y)];
    [self.animator addBehavior:collision];
    
    UIDynamicItemBehavior *ballBehavior =[[UIDynamicItemBehavior alloc] initWithItems:@[self.firstView]];
    ballBehavior.elasticity=0.70;
    [self.animator addBehavior:ballBehavior];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
