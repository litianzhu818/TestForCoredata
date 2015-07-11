//
//  Action.m
//  SingTonTest
//
//  Created by Peter Lee on 15/5/13.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "Action.h"

@implementation Action

static Action *_sharedInstance = nil;

+ (Action *)sharedInstance
{
    /*
    static Action *_sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
     */
    
    if (!_sharedInstance)
        _sharedInstance = [[self alloc] init];
    
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.number = 0;
    }
    return self;
}

- (void)action
{
    NSLog(@"单例开始执行：%ld",(long)self.number);
    
    sleep(10);
    
    self.number += 1;
    
    NSLog(@"单例开始执行：%ld",(long)self.number);
}

@end
