//
//  ViewController.m
//  TestForNSPredicate
//
//  Created by Peter Lee on 14/10/16.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData
{
    NSString *str = @"13";
    
    TestObject *obj0 = [[TestObject alloc] initWithID:@"1" name:@"litianzhu"];
    TestObject *obj1 = [[TestObject alloc] initWithID:@"12" name:@"peter lee"];
    TestObject *obj2 = [[TestObject alloc] initWithID:@"123" name:@"Tianzhu Li"];
    TestObject *obj3 = [[TestObject alloc] initWithID:@"1234" name:@"Peter Lee"];
    TestObject *obj4 = [[TestObject alloc] initWithID:@"12345" name:@"peter.lee"];
    TestObject *obj5 = [[TestObject alloc] initWithID:@"123456" name:@"李天柱"];

    NSArray *array1 = [NSArray arrayWithObjects:obj0,obj1,obj2,obj3,obj4,obj5, nil];
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"ID contains[cd] %@ || name contains[cd] %@",str,str];
    NSArray *array2 = [array1 filteredArrayUsingPredicate:resultPredicate];
    [array2 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"The result is:\n%@",((TestObject *)obj).description);
    }];
    NSLog(@"complete");
}

@end
