//
//  TestPlayerView.m
//  TestForPlayerView
//
//  Created by Peter Lee on 15/1/23.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "TestPlayerView.h"

#define DEFAULT_BUTTON_WIDTH 100.0f
#define  DEFAULT_BUTTON_HIGHT 50.0f

@interface TestPlayerView ()
{
    UIButton *up_left_btn;
    UIButton *down_left_btn;
    UIButton *up_right_btn;
    UIButton *down_right_btn;
}
@end

@implementation TestPlayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.backgroundColor = [UIColor blackColor];
    
    up_left_btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"up_left" forState:UIControlStateNormal];
        [btn setTintColor:[UIColor whiteColor]];
        [btn setBackgroundColor:[UIColor colorWithWhite:200.0 alpha:0.5]];
        [btn addTarget:self action:@selector(clikedOnButton:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(8, 8, DEFAULT_BUTTON_WIDTH, DEFAULT_BUTTON_HIGHT);
        btn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:btn];
        btn;
    });
    
    up_right_btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"up_right" forState:UIControlStateNormal];
        [btn setTintColor:[UIColor whiteColor]];
        [btn setBackgroundColor:[UIColor colorWithWhite:200.0 alpha:0.5]];
        [btn addTarget:self action:@selector(clikedOnButton:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(self.frame.size.width-8-DEFAULT_BUTTON_WIDTH, 8, DEFAULT_BUTTON_WIDTH, DEFAULT_BUTTON_HIGHT);
        btn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:btn];
        btn;
    });
    
    down_left_btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"down_left" forState:UIControlStateNormal];
        [btn setTintColor:[UIColor whiteColor]];
        [btn setBackgroundColor:[UIColor colorWithWhite:200.0 alpha:0.5]];
        [btn addTarget:self action:@selector(clikedOnButton:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(8, self.frame.size.height-8-DEFAULT_BUTTON_HIGHT, DEFAULT_BUTTON_WIDTH, DEFAULT_BUTTON_HIGHT);
        btn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:btn];
        btn;
    });
    
    down_right_btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"down_right" forState:UIControlStateNormal];
        [btn setTintColor:[UIColor whiteColor]];
        [btn setBackgroundColor:[UIColor colorWithWhite:200.0 alpha:0.5]];
        [btn addTarget:self action:@selector(clikedOnButton:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(self.frame.size.width-8-DEFAULT_BUTTON_WIDTH, self.frame.size.height-8-DEFAULT_BUTTON_HIGHT, DEFAULT_BUTTON_WIDTH, DEFAULT_BUTTON_HIGHT);
        btn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:btn];
        btn;
    });
    
}

- (void)clikedOnButton:(id)sender
{
    UIButton *btn = sender;
    
    NSLog(@"%@%@%@",@"You have cliked on the \"",btn.titleLabel.text,@"\" button");
}


@end
