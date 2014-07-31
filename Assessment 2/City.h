//
//  City.h
//  Assessment 2
//
//  Created by ETC ComputerLand on 7/31/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property NSString *name;
@property NSString *state;

-(instancetype) initWithName:(NSString *)name state:(NSString *)state;

@end
