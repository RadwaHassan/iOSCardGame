//
//  MyUser.m
//  Memory
//
//  Created by marian samy on 4/13/15.
//  Copyright (c) 2015 marian samy. All rights reserved.
//

#import "MyUser.h"

@implementation MyUser
- (id)initWithCoder:(NSCoder *)coder
{
    
    NSLog(@"decode");
    if ((self = [super init]))
    {
        // Decode the property values by key, and assign them to the correct ivars
        _name = [coder decodeObjectForKey:@"name"];
     
        _fImage = [coder decodeObjectForKey:@"image"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    // Encode our ivars using string keys
    NSLog(@"encode");
    
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeObject:_fImage forKey:@"image"];
}
@end
