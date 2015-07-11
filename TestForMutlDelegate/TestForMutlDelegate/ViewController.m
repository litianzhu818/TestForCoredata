//
//  ViewController.m
//  TestForMutlDelegate
//
//  Created by Peter Lee on 15/2/6.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "ViewController.h"
#import "ClassC.h"
@interface ViewController ()<ClassCDelegate>

@property (nonatomic, strong) ClassC *testObject;

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
    self.testObject = [[ClassC alloc] initWithDelegate:self];
    
    [self.testObject classCShowInfo];
}

#pragma mark - ClassCDelegate mthods
- (NSString *)IDWithClassC:(ClassC *)classC
{
    return @"peter.lee@afusion.com";
}

- (NSInteger)NumberWithClassB:(ClassB *)classB
{
    return 1001;
}

- (NSInteger)ageWithClassA:(ClassA *)classA
{
    return 27;
}
- (NSString *)nameWithClassA:(ClassA *)classA
{
    return @"Peter Lee";
}


@end
