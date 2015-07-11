//
//  MeInfoButton.h
//  TTYing
//
//  Created by Peter Lee on 15/4/7.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeInfoButton : UIButton

@property (strong, nonatomic) UIFont *numberFont;
@property (strong, nonatomic) UIFont *titleFont;

@property (strong, nonatomic) UIColor *numberColor;
@property (strong, nonatomic) UIColor *titleColor;

@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *titleString;

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image title:(NSString *)title;

@end
