//
//  Action.h
//  SingTonTest
//
//  Created by Peter Lee on 15/5/13.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Action : NSObject

@property (assign, nonatomic) NSInteger number;

+ (Action *)sharedInstance;
- (void)action;

@end
