//
//  ViewController.m
//  TestForArray
//
//  Created by Peter Lee on 14/12/25.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:[NSNull null], nil];
    id obj = [array objectAtIndex:0];
    
}
@end
