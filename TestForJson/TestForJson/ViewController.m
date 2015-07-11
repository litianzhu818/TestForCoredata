//
//  ViewController.m
//  TestForJson
//
//  Created by Peter Lee on 14/10/22.
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

-(void)testMethod
{
    Hello *hello = [[Hello alloc] init];
    hello.name = @"123456789";
    hello.age = 10000000;
    hello.array = [[NSMutableArray alloc] init];
    [hello.array addObject:@"134"];
    [hello.array addObject:@"去死呗"];
    People *p = [[People alloc] init];
    p.boolValue0 = YES;
    p.number0 = -1;
    p.number2 = 2;
    p.number3 = [NSNumber numberWithInt:-3];
    p.string0 = @"李天柱";
    p.char0 = 'L';
    p.array0 = @[@"Peter Lee",@"Litianzhu"];
    p.array1 = @[@"Peter Lee",@"Litianzhu"];
    p.dic1 = @{
               @"Key1":@[@"Peter Lee",@"Litianzhu"],
               @"Key2":@[@"Peter Lee",@"Litianzhu"]
               };
    p.hello = hello;
    
    NSLog(@"%@",[[NSString alloc] initWithData:[PrintObject getJSON:p options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding]);
}

@end
