//
//  MeInfoButton.m
//  TTYing
//
//  Created by Peter Lee on 15/4/7.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "MeInfoButton.h"

static const CGFloat marginWidth = 4.0f;
// mianTitleLabel的高是button本身高减去上下两个边距（2*marginWidth），再减去titleLabel和imageView中间的间距（0.5*marginWidth）的三分之一
#define mainLabelHeight (self.frame.size.height - 2.5*marginWidth)/3
// 宽是款的2倍，此时等于imageView的款和高都是2倍的mainLabelHeight
#define mainLabelWidth 2*mainLabelHeight

#define numberLabelHeight (self.frame.size.height - 2*marginWidth)
// 距离左边一个边距长度，距离中线半个边距宽度
#define numberLabelWidth (self.frame.size.width/2 - 1.5*marginWidth)

@interface MeInfoButton ()

@property (strong, nonatomic) UILabel *numberLabel;
@property (strong, nonatomic) UIImageView *mainImageView;
@property (strong, nonatomic) UILabel *mainTitleLabel;

@end

@implementation MeInfoButton

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image title:(NSString *)title
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.image = image;
        self.titleString = title;
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame image:nil title:nil];
}

- (void)setup
{
    self.imageView.hidden = YES;
    self.titleLabel.hidden = YES;
    
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(marginWidth, marginWidth, numberLabelWidth, numberLabelHeight)];
    self.numberLabel.textAlignment = NSTextAlignmentRight;
    self.numberLabel.textColor = [UIColor whiteColor];
    self.numberLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    self.numberLabel.text = self.number;
    [self addSubview:self.numberLabel];
    
    self.mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(1.5*marginWidth + self.numberLabel.frame.size.width, marginWidth, mainLabelWidth, mainLabelWidth)];
    self.mainImageView.image = self.image;
    self.mainImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.mainImageView];
    
    self.mainTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(1.5*marginWidth + self.numberLabel.frame.size.width, 1.5*marginWidth + self.mainImageView.frame.size.height, 2*mainLabelWidth, mainLabelHeight)];
    self.mainTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.mainTitleLabel.textColor = [UIColor whiteColor];
    self.mainTitleLabel.font = [UIFont systemFontOfSize:12.0];
    self.mainTitleLabel.text = _titleString;
    [self addSubview:self.mainTitleLabel];
    
    CGPoint currentCenter = self.mainImageView.center;
    currentCenter.x = self.mainTitleLabel.center.x;
    self.mainImageView.center = currentCenter;
    
    
    //self.mainImageView.backgroundColor = [UIColor redColor];
    //self.mainTitleLabel.backgroundColor = [UIColor redColor];
}

- (void)setNumberFont:(UIFont *)numberFont
{
    _numberFont = numberFont;
    self.numberLabel.font = _numberFont;
}

- (void)setNumberColor:(UIColor *)numberColor
{
    _numberColor = numberColor;
    self.numberLabel.textColor = _numberColor;
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    self.mainTitleLabel.font = _titleFont;
}

- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.mainTitleLabel.textColor = _titleColor;
}

- (void)setNumber:(NSString *)number
{
    _number = number;
    self.numberLabel.text = _number;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.mainImageView.image = _image;
}

- (void)setTitleString:(NSString *)titleString
{
    _titleString = titleString;
    self.mainTitleLabel.text = _titleString;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
