//
//  MeInfoView.h
//  TTYing
//
//  Created by Peter Lee on 15/4/7.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserObject;

@interface MeInfoView : UIImageView

@property (strong, nonatomic) UserObject *model;
@property (copy, nonatomic) void (^selectedBlock)(NSUInteger index);

- (instancetype)initWithFrame:(CGRect)frame
                selectedBlock:(void (^)(NSUInteger index))selectedBlock;

@end
