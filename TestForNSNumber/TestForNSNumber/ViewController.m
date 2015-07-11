//
//  ViewController.m
//  TestForNSNumber
//
//  Created by Peter Lee on 14/10/28.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testMethod
{
    NSUInteger index = 0;
    NSNumber *number = [NSNumber numberWithBool:!(index > 0)];
    if ([number boolValue]) {
         NSLog(@"%d",[number unsignedIntegerValue]);
    }
   
}

@end
