//
//  ViewController.m
//  SingTonTest
//
//  Created by Peter Lee on 15/5/13.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "ViewController.h"
#import "Action.h"

@interface ViewController ()
@property (assign, nonatomic) NSInteger clikedNumber;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clikedAction:(id)sender
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        NSLog(@"YES");
        [[Action sharedInstance] action];
        NSLog(@"NO");
    });
}

@end
