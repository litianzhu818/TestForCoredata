//
//  ViewController.m
//  TestForForBreak
//
//  Created by Peter Lee on 14/12/17.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (NSUInteger index = 1; index <= 3; ++index) {
        for (NSUInteger item = 1; item <= 3;NSLog(@"YES"),NSLog(@"Index:%d,Item:%d,SUM:%d",index,item,((index - 1) * 3 + item)), ++item) {
            
            if (((index - 1) * 3 + item) > 5) {
                break;
            }
            
            
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
