//
//  ClassA.h
//  TestForMutlDelegate
//
//  Created by Peter Lee on 15/2/6.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ClassADelegate;
@interface ClassA : NSObject

@property (weak, nonatomic) id<ClassADelegate> delegate;

- (instancetype)initWithDelegate:(id<ClassADelegate>) delegate;
- (void)classAShowInfo;

@end

@protocol ClassADelegate <NSObject>

@optional

- (NSInteger)ageWithClassA:(ClassA *)classA;
- (NSString *)nameWithClassA:(ClassA *)classA;

@end