//
//  User.h
//  TestForClassAndObject
//
//  Created by Peter Lee on 14/11/12.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) bool yes;

+ (id)user;
+ (id)userWithID:(NSString *)_id;
+ (id)userWithID:(NSString *)_id name:(NSString *)name;

- (instancetype)initWithID:(NSString *)_id;
- (instancetype)initWithID:(NSString *)_id name:(NSString *)name;

@end
