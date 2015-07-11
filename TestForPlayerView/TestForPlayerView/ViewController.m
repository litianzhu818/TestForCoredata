//
//  ViewController.m
//  TestForPlayerView
//
//  Created by Peter Lee on 15/1/23.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "ViewController.h"
#import "TestPlayerView.h"
@interface ViewController ()

@property (nonatomic, strong) TestPlayerView *playerView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController
@synthesize playerView;
@synthesize button;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup
{
    playerView = ({
        TestPlayerView *testPlayerView = [[TestPlayerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
        
        [self.view addSubview:testPlayerView];
        
        testPlayerView;
    });
    
    button = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"Cliked Me" forState:UIControlStateNormal];
        [btn setTintColor:[UIColor redColor]];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn addTarget:self action:@selector(clikedOnButton:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(110, 400, 100, 50);
        [self.view addSubview:btn];
        btn;
    });
    
    
}

- (void)clikedOnButton:(id)sender
{
    NSInteger a = 2345;
    NSInteger b = 1234;
    
    b = (b <= a) ? :a;
    NSLog(@"Result:%d",b);
    
    /*
    [self startAnimation];
    return;
    CGAffineTransform transfrom = CGAffineTransformMakeRotation(M_PI/2);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    
    //在这里设置view.transform需要匹配的旋转角度的大小就可以了。
    playerView.transform = transfrom;
    playerView.layer.position = CGPointMake(self.view.center.x, self.view.center.y);
    playerView.bounds = CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width);
    
    [UIView commitAnimations];
    //playerView.center = CGPointMake(self.view.center.y, self.view.center.x);
     */
}

- (void)startAnimation
{
     CGAffineTransform transfrom = CGAffineTransformMakeRotation(M_PI/2);
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        //在这里设置view.transform需要匹配的旋转角度的大小就可以了。
        playerView.transform = transfrom;
        playerView.layer.position = CGPointMake(self.view.center.x, self.view.center.y);
        playerView.bounds = CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width);
        
    } completion:^(BOOL finished) {
        //[self refusmeAnimation];
    }];
}

- (void)refusmeAnimation
{
    CGAffineTransform transfrom = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        //在这里设置view.transform需要匹配的旋转角度的大小就可以了。
        playerView.transform = transfrom;
        playerView.layer.position = CGPointMake(self.view.center.x, self.view.center.y);
        playerView.bounds = CGRectMake(0, 0, self.view.bounds.size.width, 300);
        playerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
        
    } completion:^(BOOL finished) {
        playerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
    }];
}
/*
- (CGAffineTransform)getCGAffineTransform
{
    if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        return CGAffineTransformMakeRotation(M_PI*1.5);
    } else if (orientation == UIInterfaceOrientationLandscapeRight) {
        return CGAffineTransformMakeRotation(M_PI/2);
    } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        return CGAffineTransformMakeRotation(-M_PI);
    } else {
        return CGAffineTransformIdentity;
    }
}
 */

@end
