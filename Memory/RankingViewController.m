//
//  RankingViewController.m
//  Memory
//
//  Created by marian samy on 4/4/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import "RankingViewController.h"

@interface RankingViewController ()

@end

@implementation RankingViewController

{
    
    NSArray *data;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // self.tableView2.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back3.jpg"]];
    
    data = [NSArray arrayWithObjects:@"Sarah Aabed",@"Radwa Hassan",@"Maram Osama",@"Marian",nil];
    
    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [data count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if(indexPath.row==0){
        cell.textLabel.text = [data objectAtIndex:indexPath.row];
        cell.imageView.image=[UIImage imageNamed:@"star.png"];
    }
    else
    {
        cell.textLabel.text = [data objectAtIndex:indexPath.row];
        cell.imageView.image=[UIImage imageNamed:@"badge.png"];
    }
    
    return cell;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
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
