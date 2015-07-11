//
//  ClassC.h
//  TestForMutlDelegate
//
//  Created by Peter Lee on 15/2/6.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassB.h"

@protocol ClassCDelegate;

@interface ClassC : NSObject

@property (weak, nonatomic) id<ClassCDelegate> delegate;

- (instancetype)initWithDelegate:(id<ClassCDelegate>) delegate;
- (void)classCShowInfo;

@end

@protocol ClassCDelegate <NSObject, ClassBDelegate>

@optional

- (NSString *)IDWithClassC:(ClassC *)classC;

@end
