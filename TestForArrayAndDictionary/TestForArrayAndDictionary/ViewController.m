//
//  ViewController.m
//  TestForArrayAndDictionary
//
//  Created by Peter Lee on 14/10/20.
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
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithObject:@"peter.lee" forKey:@"456"];
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionaryWithObject:@"Peter Lee" forKey:@"456"];
    NSMutableDictionary *dic3 = [NSMutableDictionary dictionaryWithObject:@"litianzhu" forKey:@"456"];
    NSArray *array = [NSArray arrayWithObjects:dic1,dic2,dic3, nil];
    
    NSLog(@"array1:%@",array.description);
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSMutableDictionary *dic = obj;
        if ([[dic objectForKey:@"456"] isEqualToString:@"peter.lee"]) {
            [dic setValue:@"Tianzhu Li" forKey:@"456"];
            *stop = YES;
        }
    }];
    NSLog(@"array2:%@",array.description);
}

@end
