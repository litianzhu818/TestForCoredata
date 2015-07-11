//
//  ClassC.m
//  TestForMutlDelegate
//
//  Created by Peter Lee on 15/2/6.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "ClassC.h"

@interface ClassC ()

@property (nonatomic, strong) ClassB *classBObject;

@end

@implementation ClassC

- (instancetype)initWithDelegate:(id<ClassCDelegate>) delegate
{
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}
- (void)classCShowInfo
{
    NSString *id = nil;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(IDWithClassC:)]) {
        id = [self.delegate IDWithClassC:self];
    }
    
    self.classBObject = [[ClassB alloc] initWithDelegate:self.delegate];
    [self.classBObject classBShowInfo];
    
    NSLog(@"%@",[NSString stringWithFormat:@"Class C:ID = %@",id]);
}


@end


