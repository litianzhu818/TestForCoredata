//
//  TestObject.m
//  TestForNSPredicate
//
//  Created by Peter Lee on 14/10/16.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

-(instancetype)initWithID:(NSString *)id name:(NSString *)name
{
    self = [super init];
    if(self){
        self.ID = id;
        self.name = name;
    }
    
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"Class:%@\n{\n\tID='%@'\n\tname='%@'\n}",NSStringFromClass([self class]),self.ID,self.name];
}
#pragma mark -
#pragma mark NSCopying Methods
- (id)copyWithZone:(NSZone *)zone
{
    TestObject *newObject = [[[self class] allocWithZone:zone] init];
    //Here is a sample for using the NScoding method
    //Add your code here
    [newObject setID:self.ID];
    [newObject setName:self.name];
    
    
    return newObject;
}

#pragma mark -
#pragma mark NSCoding Methods
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    //Here is a sample for using the NScoding method
    //Add your code here
    [aCoder encodeObject:self.ID forKey:@"ID"];
    [aCoder encodeObject:self.name forKey:@"name"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        //Here is a sample for using the NScoding method
        //Add your code here
        self.ID = [aDecoder decodeObjectForKey:@"ID"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        
    }
    return  self;
}



@end
