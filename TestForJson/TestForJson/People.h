//
//  People.h
//  TestForJson
//
//  Created by Peter Lee on 14/10/22.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hello.h"
@interface People : NSObject

@property (assign, nonatomic) int number0;
@property (assign, nonatomic) NSInteger number1;
@property (assign, nonatomic) NSUInteger number2;
@property (strong, nonatomic) NSNumber *number3;
@property (strong, nonatomic) NSString *string0;
@property (assign, nonatomic) char char0;
@property (strong, nonatomic) NSArray *array0;
@property (strong, nonatomic) NSMutableArray *array1;
@property (strong, nonatomic) NSDictionary *dic0;
@property (strong, nonatomic) NSDictionary *dic1;
@property (assign, nonatomic) BOOL boolValue0;
@property (assign, nonatomic) Hello *hello;

@end
