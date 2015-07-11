//
//  ViewController.m
//  TestForStaticCell
//
//  Created by Peter Lee on 14/10/11.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.tableView setBackgroundColor:[UIColor redColor]];
    
    NSMutableSet *set = [NSMutableSet set];
    [set addObject:@"litianzhu"];
    [set addObject:@"litianzhu"];
    [set addObject:@"litianzhu"];
    [set addObject:@"litianzhu"];
    [set addObject:@"litianzhu"];
    [set addObject:@"litianzhu"];
    [set addObject:@"litianzhu"];
    [set addObject:@"litianzhu"];
    [set addObject:@"litianzhu"];
    [set addObject:@"litianzhu"];
    //[dic setObject:@"李天柱" forKey:@"litianzhu"];
    //[dic setObject:@"Peter Lee" forKey:@"litianzhu"];
    NSLog(@"%@",set.description);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
