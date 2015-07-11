//
//  ClassA.m
//  TestForMutlDelegate
//
//  Created by Peter Lee on 15/2/6.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "ClassA.h"

@implementation ClassA

- (instancetype)initWithDelegate:(id<ClassADelegate>) delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}
- (void)classAShowInfo
{
    NSString *name = nil;
    NSInteger age = -1;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(nameWithClassA:)]) {
        name = [self.delegate nameWithClassA:self];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ageWithClassA:)]) {
        age = [self.delegate ageWithClassA:self];
    }
    
    NSLog(@"%@",[NSString stringWithFormat:@"Class B:Name = %@\tAge = %ld",name,age]);
}

@end
