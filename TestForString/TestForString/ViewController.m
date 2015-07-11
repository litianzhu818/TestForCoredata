//
//  ViewController.m
//  TestForString
//
//  Created by Peter Lee on 14/10/17.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [NSTimer scheduledTimerWithTimeInterval:0.00000001 target:self selector:@selector(getString) userInfo:nil repeats:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getString
{
    CFUUIDRef uuidRef =CFUUIDCreate(NULL);
    
    CFStringRef uuidStringRef =CFUUIDCreateString(NULL, uuidRef);
    
    CFRelease(uuidRef);
    
    NSString *uniqueId = (__bridge NSString *)uuidStringRef;
    NSLog(@"字符串：%@",uniqueId);
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"123"];
}

@end
