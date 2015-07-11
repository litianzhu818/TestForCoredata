//
//  MeInfoView.m
//  TTYing
//
//  Created by Peter Lee on 15/4/7.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "MeInfoView.h"
#import "MeInfoButton.h"
#import "UserObject.h"

@interface MeInfoView ()

@property (strong, nonatomic) MeInfoButton *redButton;//红包
@property (strong, nonatomic) MeInfoButton *integralButton;//积分
@property (strong, nonatomic) MeInfoButton *msgButton;//消息

@end

@implementation MeInfoView

- (instancetype)initWithFrame:(CGRect)frame selectedBlock:(void (^)(NSUInteger index))selectedBlock
{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectedBlock = selectedBlock;
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame selectedBlock:NULL];
}

- (void)setup
{
    // Dock贴紧父控件底部，即保持在Cell底部
    self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    
    // 接受用户交互
    self.userInteractionEnabled = YES;
    
    self.image = [UIImage imageNamed:@"第一行-标签栏_02"];
    
    // 添加3个按钮
    _redButton = [self addButtonWithImage:@"红包" title:@"红包" buttonIndex:0];
    _integralButton = [self addButtonWithImage:@"积分" title:@"积分" buttonIndex:1];
    _msgButton = [self addButtonWithImage:@"消息" title:@"消息" buttonIndex:2];;
    
}

- (MeInfoButton *)addButtonWithImage:(NSString *)imageName title:(NSString *)title buttonIndex:(NSInteger)index
{
    
    // 按钮尺寸位置
    CGFloat buttonWidth = self.frame.size.width / 3;
    
    // 按钮基本属性设置
    MeInfoButton *button = [[MeInfoButton alloc] initWithFrame:CGRectMake(index * buttonWidth, 0, buttonWidth, self.frame.size.height)
                                                         image:[UIImage imageNamed:imageName]
                                                         title:title];
    [self addSubview:button];
    [button setTag:index];
    
    [button addTarget:self action:@selector(clikedOnButton:) forControlEvents:UIControlEventTouchUpInside];
    
    // 添加按钮间间隔图片
    if (index) {
        UIImageView *cardButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"第一行-竖的一条粗线_03"]];
        [self addSubview:cardButton];
        cardButton.center = CGPointMake(button.frame.origin.x, self.frame.size.height * 0.5);
    }
    
    return button;
}

- (void)clikedOnButton:(id)sender
{
    MeInfoButton *btn = sender;
    if (self.selectedBlock) {
        self.selectedBlock(btn.tag);
    }
}

- (void)setModel:(UserObject *)model
{
    _model = model;
    
    _redButton.number = [self stringWithNumber:model.redCount];
    _integralButton.number = [self stringWithNumber:model.integral];
    _msgButton.number = [self stringWithNumber:model.msgCount];
}

- (NSString *)stringWithNumber:(NSUInteger)number
{
   if (number >= 10000 ){
        return [NSString stringWithFormat:@"%.f%@",(number/10000.00),@"万"];
    }else{
        return [NSString stringWithFormat:@"%lu",number];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
