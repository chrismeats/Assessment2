//
//  City.m
//  Assessment 2
//
//  Created by ETC ComputerLand on 7/31/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import "City.h"

@implementation City

-(instancetype) initWithName:(NSString *)name state:(NSString *)state
{
    self = [super init];
    self.name = name;
    self.state = state;
    return self;
}

@end
