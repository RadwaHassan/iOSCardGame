//
//  UserRanking.h
//  Memory
//
//  Created by JETS on 4/13/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserRanking : NSObject <NSCoding>
@property NSString *userName;
@property NSString *userScore;
@property NSData *userImage;
@end
