//
//  TestObject.h
//  TestForNSPredicate
//
//  Created by Peter Lee on 14/10/16.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject

@property (strong, nonatomic) NSString *ID;
@property (strong, nonatomic) NSString *name;

-(instancetype)initWithID:(NSString *)id name:(NSString *)name;

@end
