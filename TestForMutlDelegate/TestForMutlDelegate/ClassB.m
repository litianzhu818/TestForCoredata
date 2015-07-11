//
//  ClassB.m
//  TestForMutlDelegate
//
//  Created by Peter Lee on 15/2/6.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "ClassB.h"

@interface ClassB ()
@property(nonatomic, strong) ClassA *classAObject;
@end

@implementation ClassB

- (instancetype)initWithDelegate:(id<ClassBDelegate>) delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}
- (void)classBShowInfo
{
    NSInteger number = -1;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(NumberWithClassB:)]) {
        number = [self.delegate NumberWithClassB:self];
    }

    self.classAObject = [[ClassA alloc] initWithDelegate:self.delegate];
    [self.classAObject classAShowInfo];
    
    NSLog(@"%@",[NSString stringWithFormat:@"Class B:Number = %ld",number]);
}

@end
