//
//  ClassB.h
//  TestForMutlDelegate
//
//  Created by Peter Lee on 15/2/6.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassA.h"

@protocol ClassBDelegate;

@interface ClassB : NSObject

@property (weak, nonatomic) id<ClassBDelegate> delegate;

- (instancetype)initWithDelegate:(id<ClassBDelegate>) delegate;
- (void)classBShowInfo;

@end

@protocol ClassBDelegate <NSObject, ClassADelegate>

@optional

- (NSInteger)NumberWithClassB:(ClassB *)classB;

@end
