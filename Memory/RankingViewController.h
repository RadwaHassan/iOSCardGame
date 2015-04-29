//
//  RankingViewController.h
//  Memory
//
//  Created by marian samy on 4/4/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"
@interface RankingViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property(nonatomic, strong)  NSMutableArray *names;
@property(nonatomic, strong)  NSMutableArray *score;
-(void)saveToPlist:(NSMutableArray*) rankingArray;
-(NSMutableArray*)readFromPlist;
//test
@end
