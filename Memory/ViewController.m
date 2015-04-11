//
//  ViewController.m
//  Memory
//
//  Created by marian samy on 3/30/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString *backCard;
}

@end

@implementation ViewController

NSInteger *currentSecond = 0;

@synthesize cardsImages;
@synthesize cardsButtonsArray;
@synthesize firstClick;
@synthesize secondClick;
@synthesize firstClickButton;
@synthesize secondClickButton;
@synthesize  seconds;
@synthesize timer;
@synthesize score;
@synthesize timerLabel;
@synthesize scoreLable;
@synthesize cardMatchedCounter;
@synthesize touchOK;

NSInteger firstIndex ;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"radwa2.jpg"]]];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self setupGame];
    
}


// set up the game
- (void)setupGame{
    backCard= @"face.png";
    seconds = 0;
    score = 0;
    cardMatchedCounter=0;
    self.touchOK = YES;
    
    cardsImages = [[NSMutableArray alloc] initWithObjects:
                   @"1.png",
                   @"2.png",
                   @"3.png",
                   @"4.png",
                   @"5.png",
                   @"6.png",
                   @"7.png",
                   @"8.png",
                   @"1.png",
                   @"2.png",
                   @"3.png",
                   @"4.png",
                   @"5.png",
                   @"6.png",
                   @"7.png",
                   @"8.png",
                   nil];
    
    timerLabel.text = [NSString stringWithFormat:@"Time: %i",seconds];
    scoreLable.text = [NSString stringWithFormat:@"Score: %i",score];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
    self.flipAllCardsBack;
    
    //make the images in the cardsImages array random
    NSUInteger count = [cardsImages count];
    
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        int nElements = count - i;
        int n = (arc4random() % nElements) + i;
        [cardsImages exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}


- (IBAction)cardClicked:(id)sender{
    
    if (touchOK) {
        
        //make sound effect on click
        
        //**** uncomment this part for xcode 5
//        NSString *pathToMySound = [[NSBundle mainBundle] pathForResource:@"multimedia_button_click" ofType:@"mp3"];
//        SystemSoundID soundID;
//        AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath: pathToMySound]), &soundID);
//        AudioServicesPlaySystemSound(soundID);

        
        
        //**** comment this part for xcode 5
        NSString *soundFilePath = [NSString stringWithFormat:@"%@/%@.mp3",
                                   [[NSBundle mainBundle] resourcePath], @"multimedia_button_click"];
        NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
        
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                         error:nil];
        _player.numberOfLoops = 0;
        
        [_player play];
        
        
    NSInteger index = [sender tag];
    NSLog(@"%ld",(long)index);
    NSLog(@"%ld",(unsigned long)[cardsImages count]);
        
    // clickedButton the button that has been clicked
    UIButton *clickedButton=[cardsButtonsArray objectAtIndex:index-1];
        
    //check if this is the second time
    //the user click on button
    if (firstClick != nil) {
        
        //prevent the user from click on third button
        touchOK=NO;
        
        NSLog(@" index %ld",(long)index);
        NSLog(@"findex %ld",(long)firstIndex);
        
        //to make sure the user not
        //click on the same button twice
        if(firstIndex != index) {
            
            NSLog(@"%ld",(long)index);
            NSLog(@"%ld",(unsigned long)[cardsImages count]);
            
            
            secondClick=[cardsImages objectAtIndex:index-1];
            self.secondClickButton=[cardsButtonsArray objectAtIndex:index-1];
            
            //flip the second button and set image to it
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:sender cache:NO];
            [UIView commitAnimations];
            [sender setImage:[UIImage imageNamed:[cardsImages objectAtIndex:index-1]] forState:UIControlStateNormal];
            
            //prevent the user from click it again
            secondClickButton.userInteractionEnabled=NO;
            
            //if the two buttons not matched
            if (![firstClick isEqualToString:secondClick]) {
                
                //enable these buttons again
                //to enable the user to click them
                secondClickButton.userInteractionEnabled=YES;
                firstClickButton.userInteractionEnabled=YES;
                
                //flip them back after 1 sec
                [NSTimer scheduledTimerWithTimeInterval:1.0
                                                 target:self
                                               selector:@selector(flipCardsBack)
                                               userInfo:nil
                                                repeats:NO];
            }
        
        
            //the two buttons are matched
        else{
            
            //make sound effect on click when matched
            
            //****uncomment this part for xcode 5
            
//            NSString *pathToMySound = [[NSBundle mainBundle] pathForResource:@"matched" ofType:@"mp3"];
//            SystemSoundID soundID;
//            AudioServicesCreateSystemSoundID((__bridge CFURLRef)([NSURL fileURLWithPath: pathToMySound]), &soundID);
//            AudioServicesPlaySystemSound(soundID);
//            
            
            
            //**** comment this part for xcode 5
            NSString *soundFilePath = [NSString stringWithFormat:@"%@/%@.mp3",
                                       [[NSBundle mainBundle] resourcePath], @"matched"];
            NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
            
            _player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                             error:nil];
            _player.numberOfLoops = 0;
            
            [_player play];
            touchOK=YES;
            
            cardMatchedCounter++;
            
            //make the two buttons unclickable and transparent
            secondClickButton.userInteractionEnabled = NO;
            //make the button transparent
            secondClickButton.alpha=0.5;
            firstClickButton.userInteractionEnabled = NO;
            firstClickButton.alpha=0.5;
            
            //increase the score
            score=score+100;
            
            //if the user finish the game before
            //time is up
            if (cardMatchedCounter == 8) {
                
                UIAlertView *winAlert = [[UIAlertView alloc]
                                              initWithTitle:@"Excellent"
                                              message:@"You win"
                                              delegate:self
                                              cancelButtonTitle:@"Share your score"
                                              otherButtonTitles:@"Home",nil];
                [winAlert show];
                [timer invalidate];
                
            }
            
            
            printf("count = %ld",(long)score);
            scoreLable.text = [NSString stringWithFormat:@"Score: %li",(long)score];
            
        }
        //reset the first button reference
        firstClick=nil;
        firstIndex=nil;
        }
        
        //the user click on the first card
    }else{
        firstIndex = [sender tag];
        NSLog(@"findex %ld",(long)firstIndex);
        
        // flip the first card and set image on it
        firstClick=[cardsImages objectAtIndex:index-1];
        self.firstClickButton=[cardsButtonsArray objectAtIndex:index-1];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:sender cache:NO];
        [UIView commitAnimations];
        [sender setImage:[UIImage imageNamed:[cardsImages objectAtIndex:index-1]] forState:UIControlStateNormal];
        firstClickButton.userInteractionEnabled=NO;
        
        
    }
    
    }
}


//flip the two cards back if the two cards are not match
- (void) flipCardsBack{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:firstClickButton cache:NO];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:secondClickButton cache:NO];
    [UIView commitAnimations];
    
    [firstClickButton setImage:[UIImage imageNamed:backCard] forState:UIControlStateNormal];
    [secondClickButton setImage:[UIImage imageNamed:backCard] forState:UIControlStateNormal];
    
    firstClickButton=secondClickButton=nil;
    touchOK=YES;
}


//flip all cards to back for new game
- (void) flipAllCardsBack{
    
    for (int counter=0; counter < [cardsButtonsArray count]; counter++) {
        [[cardsButtonsArray objectAtIndex:counter] setUserInteractionEnabled:YES ];
        [[cardsButtonsArray objectAtIndex:counter] setAlpha:1 ];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.25];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[cardsButtonsArray objectAtIndex:counter] cache:NO];
        [UIView commitAnimations];
        
        
        [[cardsButtonsArray objectAtIndex:counter] setImage:[UIImage imageNamed:backCard] forState:UIControlStateNormal];
        
        
       
    }
     touchOK=YES;
}


- (void)subtractTime{
    seconds++;
    if (cardMatchedCounter>0) {
        score=score-2;

    }
    timerLabel.text = [NSString stringWithFormat:@"Time: %li",(long)seconds];
    scoreLable.text = [NSString stringWithFormat:@"Score: %li",(long)score];
    if(seconds == 60){
        [timer invalidate];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!" message:[NSString stringWithFormat:@"You scored %i points",score] delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:@"Home",nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
   
    switch (buttonIndex) {
        case 0:
            if ([alertView.title isEqualToString:@"Excellent"]) {
                [self shareOnFaceBook];

            }
            else{
                [self setupGame];

            }
            break;
        case 1:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        default:
            break;
    }
    
}

-(void) shareOnFaceBook{
    if(![SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])  {
        NSLog(@"log output of your choice here");
    }
    // Facebook may not be available but the SLComposeViewController will handle the error for us.
    self.mySLComposerSheet = [[SLComposeViewController alloc] init];
    self.mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    NSString *postMessage=[NSString stringWithFormat:@"You scored %ld points in %ld Second \n You can download MemoCard From www.Team5.com",(long)score,(long)seconds];
    [self.mySLComposerSheet setInitialText:postMessage];
    
    [self presentViewController:self.mySLComposerSheet animated:YES completion:nil];
    
    [self.mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
        NSString *output;
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                output = @"Action Cancelled";
                [self.navigationController popViewControllerAnimated:YES];

                break;
            case SLComposeViewControllerResultDone:
                output = @"Post Successfull";
                [self.navigationController popViewControllerAnimated:YES];
                break;
            default:
                break;
        }
        if (![output isEqualToString:@"Action Cancelled"]) {
            // Only alert if the post was a success. Or not! Up to you.
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:output delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        }
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated{
    [timer invalidate];

}


@end
