//
//  UserObject.h
//  TTYing
//
//  Created by  李天柱 on 15/4/6.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  vip等级
 */
typedef NS_ENUM(NSUInteger, vipLevel) {
    /**
     *  vip1
     */
    vipLevelOne = 0,
    /**
     *  vip2
     */
    vipLevelTwo,
    /**
     *  vip3
     */
    vipLevelThree
};

@interface UserObject : NSObject <NSCopying, NSCoding>
// 用户ID
@property (strong, nonatomic) NSString *ID;
// 用户名称
@property (strong, nonatomic) NSString *name;
// 用户头像下载连接
@property (strong, nonatomic) NSString *imageURL;
// 用户手机号码
@property (strong, nonatomic) NSString *phoneNumber;
// 用户vip等级
@property (assign, nonatomic) vipLevel vipLevel;
// 用户账户总额
@property (assign, nonatomic) double amount;
// 用户可用账户总额
@property (assign, nonatomic) double availbleAmount;
// 红包个数
@property (assign, nonatomic) NSUInteger redCount;
// 红包总额
@property (assign, nonatomic) double redAmount;
// 积分
@property (assign, nonatomic) NSUInteger integral;
// 消息数量
@property (assign, nonatomic) NSUInteger msgCount;
// 累计收益
@property (assign, nonatomic) double allGains;
// 代收金额
@property (assign, nonatomic) double willGains;
// 推荐金额
@property (assign, nonatomic) double recommendAmount;
// 冻结金额
@property (assign, nonatomic) double frozenAmount;
// 推荐链接
@property (strong, nonatomic) NSString *recommendURL;

- (id)initWithDictionary:(NSDictionary *)dic;
- (void)updateWithDictionary:(NSDictionary *)dic;

@end
