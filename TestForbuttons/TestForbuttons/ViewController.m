//
//  ViewController.m
//  TestForbuttons
//
//  Created by Peter Lee on 15/4/7.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "ViewController.h"
#import "MeInfoView.h"
#import "UserObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UserObject *model = [[UserObject alloc] init];
    model.redCount = 20;
    model.integral = 99999;
    model.msgCount = 5;
    
    MeInfoView *infoView = [[MeInfoView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 44) selectedBlock:^(NSUInteger index) {
        
    }];
    
    infoView.model = model;
    
    [self.view addSubview:infoView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
