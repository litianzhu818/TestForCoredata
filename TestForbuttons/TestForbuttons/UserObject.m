//
//  UserObject.m
//  TTYing
//
//  Created by  李天柱 on 15/4/6.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "UserObject.h"

@implementation UserObject

- (id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        [self updateWithDictionary:dic];
    }
    
    return self;
}

- (void)updateWithDictionary:(NSDictionary *)dic
{
    self.ID = [dic objectForKey:@"id"];
    self.name = [dic objectForKey:@"name"];
    self.imageURL = [dic objectForKey:@"imageURL"];
    self.phoneNumber = [dic objectForKey:@"phoneNumber"];
    self.recommendURL = [dic objectForKey:@"recommendURL"];
    
    self.vipLevel = [(NSNumber *)[dic objectForKey:@"vipLevel"] unsignedIntegerValue];
    self.redCount = [(NSNumber *)[dic objectForKey:@"redCount"] unsignedIntegerValue];
    self.integral = [(NSNumber *)[dic objectForKey:@"integral"] unsignedIntegerValue];
    self.msgCount = [(NSNumber *)[dic objectForKey:@"msgCount"] unsignedIntegerValue];
    
    self.amount = [(NSNumber *)[dic objectForKey:@"amount"] doubleValue];
    self.availbleAmount = [(NSNumber *)[dic objectForKey:@"availbleAmount"] doubleValue];
    self.redAmount = [(NSNumber *)[dic objectForKey:@"redAmount"] doubleValue];
    self.allGains = [(NSNumber *)[dic objectForKey:@"allGains"] doubleValue];
    self.willGains = [(NSNumber *)[dic objectForKey:@"willGains"] doubleValue];
    self.recommendAmount = [(NSNumber *)[dic objectForKey:@"recommendAmount"] doubleValue];
    self.frozenAmount = [(NSNumber *)[dic objectForKey:@"frozenAmount"] doubleValue];
}

#pragma mark NSCopying Methods
- (id)copyWithZone:(NSZone *)zone
{
    UserObject *newObject = [[[self class] allocWithZone:zone] init];
    //Here is a sample for using the NScoding method
    //Add your code here
    [newObject setID:self.ID];
    [newObject setName:self.name];
    [newObject setImageURL:self.imageURL];
    [newObject setPhoneNumber:self.phoneNumber];
    [newObject setRecommendURL:self.recommendURL];
    
    [newObject setVipLevel:self.vipLevel];
    [newObject setRedCount:self.redCount];
    [newObject setIntegral:self.integral];
    [newObject setMsgCount:self.msgCount];
    
    [newObject setAmount:self.amount];
    [newObject setAvailbleAmount:self.availbleAmount];
    [newObject setRedAmount:self.redAmount];
    [newObject setAllGains:self.allGains];
    [newObject setWillGains:self.willGains];
    [newObject setRecommendAmount:self.recommendAmount];
    [newObject setFrozenAmount:self.frozenAmount];
    
    return newObject;
}

#pragma mark NSCoding Methods
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    //Here is a sample for using the NScoding method
    //Add your code here
    [aCoder encodeObject:self.ID forKey:@"ID"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.imageURL forKey:@"imageURL"];
    [aCoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
    [aCoder encodeObject:self.recommendURL forKey:@"recommendURL"];
    
    [aCoder encodeObject:[NSNumber numberWithUnsignedInteger:self.vipLevel] forKey:@"vipLevel"];
    [aCoder encodeObject:[NSNumber numberWithUnsignedInteger:self.redCount] forKey:@"redCount"];
    [aCoder encodeObject:[NSNumber numberWithUnsignedInteger:self.integral] forKey:@"integral"];
    [aCoder encodeObject:[NSNumber numberWithUnsignedInteger:self.msgCount] forKey:@"msgCount"];
    
    [aCoder encodeObject:[NSNumber numberWithDouble:self.amount] forKey:@"amount"];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.availbleAmount] forKey:@"availbleAmount"];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.redAmount] forKey:@"redAmount"];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.allGains] forKey:@"allGains"];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.willGains] forKey:@"willGains"];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.recommendAmount] forKey:@"recommendAmount"];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.frozenAmount] forKey:@"frozenAmount"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        //Here is a sample for using the NScoding method
        //Add your code here
        self.ID = [aDecoder decodeObjectForKey:@"ID"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.imageURL = [aDecoder decodeObjectForKey:@"imageURL"];
        self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
        self.recommendURL = [aDecoder decodeObjectForKey:@"recommendURL"];
        
        self.vipLevel = [(NSNumber *)[aDecoder decodeObjectForKey:@"vipLevel"] unsignedIntegerValue];
        self.redCount = [(NSNumber *)[aDecoder decodeObjectForKey:@"redCount"] unsignedIntegerValue];
        self.integral = [(NSNumber *)[aDecoder decodeObjectForKey:@"integral"] unsignedIntegerValue];
        self.msgCount = [(NSNumber *)[aDecoder decodeObjectForKey:@"msgCount"] unsignedIntegerValue];
        
        self.amount = [(NSNumber *)[aDecoder decodeObjectForKey:@"amount"] doubleValue];
        self.availbleAmount = [(NSNumber *)[aDecoder decodeObjectForKey:@"availbleAmount"] doubleValue];
        self.redAmount = [(NSNumber *)[aDecoder decodeObjectForKey:@"redAmount"] doubleValue];
        self.allGains = [(NSNumber *)[aDecoder decodeObjectForKey:@"allGains"] doubleValue];
        self.willGains = [(NSNumber *)[aDecoder decodeObjectForKey:@"willGains"] doubleValue];
        self.recommendAmount = [(NSNumber *)[aDecoder decodeObjectForKey:@"recommendAmount"] doubleValue];
        self.frozenAmount = [(NSNumber *)[aDecoder decodeObjectForKey:@"frozenAmount"] doubleValue];

    }
    return  self;
}

@end
