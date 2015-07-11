//
//  User.m
//  TestForClassAndObject
//
//  Created by Peter Lee on 14/11/12.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import "User.h"

@implementation User
- (instancetype)init
{
    return [self initWithID:nil];
}
- (instancetype)initWithID:(NSString *)_id
{
    return [self initWithID:_id name:nil];
}
- (instancetype)initWithID:(NSString *)_id name:(NSString *)name
{
    if (self = [super init]) {
        [self setID:_id];
        [self setName:name];
    }
    return self;
}

+ (id)user
{
    return [User userWithID:nil];
}

+ (id)userWithID:(NSString *)_id
{
    return [User userWithID:_id name:nil];
}
+ (id)userWithID:(NSString *)_id name:(NSString *)name
{
    return [[User alloc] initWithID:_id name:name];
}

@end
