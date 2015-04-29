//
//  RankingViewController.m
//  Memory
//
//  Created by marian samy on 4/4/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import "RankingViewController.h"
#import "UserRanking.h"
@interface RankingViewController (){
    
    // NSMutableArray *names;
  //  NSMutableArray *score;
    NSMutableString  * str;
    NSString *filePath;
    NSString * RankingPListPath;
    NSData *oldData;
    NSData *nsdata;
    NSMutableArray *arrayUserRanking;
    BOOL checkNetwork;
}

@end

@implementation RankingViewController

@synthesize names;
@synthesize score;

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"from did receive data ........");
    
    NSString *temp=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",temp);
    if(data!=nil){
        [str appendString:temp];
        printf("kkk");
        NSLog(@"%@",str);
    }
    //printf("%s",[str UTF8String]);
    
    //   NSData * data2=[str dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *jsonArr=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    for(NSDictionary * json in jsonArr){
        NSString * name=[json valueForKey:@"name"];
        printf("%s  ",[name UTF8String]);
        
        //  NSInteger * scoreVal=[[json valueForKey:@"score"]integerValue];
        
        NSString * scoreVal=[json valueForKey:@"score"];
        [names addObject:name];
        
        [score addObject:scoreVal];
        //NSLog(scoreVal);
        
        [self.tableView reloadData];
        
        
        UserRanking *userRanking=[UserRanking new];
        [userRanking setUserName:name];
        [userRanking setUserScore:scoreVal];
        [arrayUserRanking addObject:userRanking];
        
    }
    [self saveToPlist:arrayUserRanking];

}

- (void) connectionDidFinishloading:(NSURLConnection *)connection {
    NSLog(@"jjjjjj");
    NSData * data2=[str dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *jsonArr=[NSJSONSerialization JSONObjectWithData:data2 options:0 error:nil];
    
    for(NSDictionary * json in jsonArr){
        NSString * name=[json valueForKey:@"name"];
        printf("yyyyy%s",[name UTF8String]);
        
        //  NSInteger * scoreVal=[[json valueForKey:@"score"]integerValue];
        
        NSString * scoreVal=[json valueForKey:@"score"];
        [names addObject:name];
        [score addObject:scoreVal];
        [self.tableView reloadData];
        
        
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    filePath = @"/Users/mariansamy/Desktop/version44iosproject/iOSProject-2/iOSCardGame";
    RankingPListPath = [filePath stringByAppendingPathComponent:@"rankinkplist.plist"];
    names=[NSMutableArray new];
    score=[NSMutableArray new];
  checkNetwork=[self checkInternet];
    
    arrayUserRanking = [NSMutableArray new];
//        nsdata = [[NSData alloc] initWithContentsOfFile:RankingPListPath];
//    
//            arrayUserRanking = [NSKeyedUnarchiver unarchiveObjectWithData:nsdata];
//    nsdata = [NSKeyedArchiver archivedDataWithRootObject:arrayUserRanking];
//    
//    [nsdata writeToFile:RankingPListPath atomically:YES];
   // arrayUserRanking=[self ]
 

   // NSLog([NSString stringWithFormat:@"%@",checkNetwork]);
    if (checkNetwork == YES) {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"radwa2.jpg"]]];
        str=[NSMutableString new];
        NSString *final=[NSString stringWithFormat:@"http://10.145.17.224:8084/IosCardGameServer/Ranking"];
        NSURL *url=[[NSURL alloc]initWithString:final];
        NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url];
        NSURLConnection *connection=[[NSURLConnection alloc]initWithRequest:request delegate:self];
        [connection start];
        
        
    }
    else{
                nsdata = [[NSData alloc] initWithContentsOfFile:RankingPListPath];
        
                    arrayUserRanking = [NSKeyedUnarchiver unarchiveObjectWithData:nsdata];
    
    }
  
    
    
}

-(void)viewWillAppear:(BOOL)animated{
//    nsdata = [NSKeyedArchiver archivedDataWithRootObject:arrayUserRanking];
//    
//    [nsdata writeToFile:RankingPListPath atomically:YES];
//    nsdata = [[NSData alloc] initWithContentsOfFile:RankingPListPath];
//    
//        arrayUserRanking = [NSKeyedUnarchiver unarchiveObjectWithData:nsdata];
    
    
   // [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (checkNetwork == YES) {
        return [names count];

    }else{
        return [arrayUserRanking count];
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    if (checkNetwork == YES) {
        if(indexPath.row==0){
            cell.textLabel.text = [names objectAtIndex:indexPath.row];
            NSString *str = [NSString stringWithFormat:@"%@" , [score objectAtIndex:indexPath.row]];
            cell.detailTextLabel.text=str;
            cell.imageView.image=[UIImage imageNamed:@"star.png"];
        }
        else
        {
            cell.textLabel.text = [names objectAtIndex:indexPath.row];
            NSString *str = [NSString stringWithFormat:@"%@" , [score objectAtIndex:indexPath.row]];
            cell.detailTextLabel.text=str;
            cell.imageView.image=[UIImage imageNamed:@"star.png"];
        }
    }else{
        UserRanking *user=[UserRanking new];

        if(indexPath.row==0){
            
            user=[arrayUserRanking objectAtIndex:indexPath.row];
            
            cell.textLabel.text = [user userName];
           // NSString *str = [NSString stringWithFormat:@"%@" , [score objectAtIndex:indexPath.row]];
           cell.detailTextLabel.text=[NSString stringWithFormat:@"%@" , [user userScore]];
            cell.imageView.image=[UIImage imageNamed:@"star.png"];
        }
        else
        {
            user=[arrayUserRanking objectAtIndex:indexPath.row];

            cell.textLabel.text = [user userName];
            // NSString *str = [NSString stringWithFormat:@"%@" , [score objectAtIndex:indexPath.row]];
            cell.detailTextLabel.text=[NSString stringWithFormat:@"%@" , [user userScore]];
            cell.imageView.image=[UIImage imageNamed:@"star.png"];
        }
    
    }
    

    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //delete the selected item
        //[friendManager deleteFriend:[[myFriendList objectAtIndex:indexPath.row ]name]];
        
        //save the new array to hte plist
       // [self saveArray:[friendManager friendList]];
        //delete it from the table view
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



-(BOOL) connectedToNetwork
{
    Reachability *r = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus internetStatus = [r currentReachabilityStatus];
    BOOL internet;
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)) {
        internet = NO;
    } else {
        internet = YES;
    }
    return internet;
} 

-(BOOL) checkInternet
{
    //Make sure we have internet connectivity
    if([self connectedToNetwork] != YES)
    {
//        [self showMessage: @"No network connection found. An Internet connection is required for this application to work"
//                withTitle:@"No Network Connectivity!"];
        return NO;
    }
    else {
        return YES;
    }
}


-(void)saveToPlist:(NSMutableArray *)rankingArray{
    oldData = [[NSData alloc] initWithContentsOfFile:RankingPListPath];
    
    //data is not empty .. plist has data from before
    if ([oldData length ] != 0){
        printf("old data is not empty\n");
        arrayUserRanking = [NSKeyedUnarchiver unarchiveObjectWithData:oldData];
        
    }
//    UserRanking *userRanking = [UserRanking new];
//    
//    [userRanking setUserName:@"Radwa"];
//    [userRanking setUserScore:[[NSNumber alloc] initWithInt:203]];
//    NSData *dataaaa = UIImagePNGRepresentation([UIImage imageNamed:@"1.png"]);
//    [userRanking setUserImage:dataaaa];
//    
//    [arrayUserRanking addObject:userRanking];
    
    //printf("count of array = %d",[arrayUserRanking count]);
    
    nsdata = [NSKeyedArchiver archivedDataWithRootObject:rankingArray];
    
    [nsdata writeToFile:RankingPListPath atomically:YES];
    
}

@end
