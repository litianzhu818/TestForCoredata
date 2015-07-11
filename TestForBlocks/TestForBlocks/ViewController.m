//
//  ViewController.m
//  TestForBlocks
//
//  Created by Peter Lee on 15/4/9.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *array = [NSMutableArray array];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    void (^Test1Block)(NSString *str) = ^(NSString *str){
        NSLog(@"1这里的值是:%@",str);
    };
    [array addObject:Test1Block];
    [dic setValue:Test1Block forKey:@"1"];
    void (^Test2Block)(NSString *str) = ^(NSString *str){
        NSLog(@"2这里的值是:%@",str);
    };
    [array addObject:Test2Block];
    [dic setValue:Test2Block forKey:@"2"];
    void (^Test3Block)(NSString *str) = ^(NSString *str){
        NSLog(@"3这里的值是:%@",str);
    };
    [array addObject:Test3Block];
    [dic setValue:Test3Block forKey:@"3"];
    void (^Test4Block)(NSString *str) = ^(NSString *str){
        NSLog(@"4这里的值是:%@",str);
    };
    [array addObject:Test4Block];
    [dic setValue:Test4Block forKey:@"4"];
    void (^Test5Block)(NSString *str) = ^(NSString *str){
        NSLog(@"5这里的值是:%@",str);
    };
    [array addObject:Test5Block];
    [dic setValue:Test5Block forKey:@"5"];
    
    typedef void (^TestBlock)(NSString *str);
    
    TestBlock block2 = (TestBlock)[array objectAtIndex:2];
    TestBlock block4 = (TestBlock)[array objectAtIndex:4];
    
    TestBlock block1 = (TestBlock)[dic objectForKey:@"1"];
    
    block2(@"2测试!");
    block4(@"2测试!");
    
    block1(@"1测试！");
    [array removeObject:block2];
    [array removeObject:block4];
    [dic removeObjectForKey:@"1"];
    
    TestBlock block3 = (TestBlock)[array objectAtIndex:2];
    block3(@"3测试!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
