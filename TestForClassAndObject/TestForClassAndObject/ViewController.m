//
//  ViewController.m
//  TestForClassAndObject
//
//  Created by Peter Lee on 14/11/12.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import <objc/runtime.h>

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

- (void)testMethod
{
    User *user1 = [[User alloc] initWithID:@"ID1" name:@"name1"];
    
    
    NSString *className = NSStringFromClass([user1 class]);
    
    const char *cClassName = [className UTF8String];
    
    id theClass = objc_getClass(cClassName);
    
    unsigned int outCount;
    
    objc_property_t *properties = class_copyPropertyList(theClass, &outCount);
    
    for (int index = 0; index < outCount; ++index) {
        
        objc_property_t property = properties[index];
        
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        SEL selector = NSSelectorFromString(propertyName);
        id value = [theClass performSelector:selector];
        if ([value isKindOfClass:[NSString class]]) {
            NSLog(@"YES");
        }
        
        if (value == nil)
        {
            value = [NSNull null];
        }
        
    }
    
    
//    unsigned int numberofIvars = 0;
//    Ivar* ivars = class_copyIvarList(theClass, &numberofIvars);
//    for(const Ivar* p = ivars; p< ivars+numberofIvars;p++){
//        Ivar const ivar = *p ;
//        const char* keyType  = ivar_getTypeEncoding(ivar);
//        NSString* keyTypeValue  = [[NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//        NSString* key = [NSString stringWithUTF8String:ivar_getName(ivar)];
//        //            NSLog(@"cTypeByte = %@", keyTypeValue);
//        //            if([keyTypeValue isEqual:cTypeArray]){
//        ////                NSNumber* val = [NSNumber numberWithLongLong:10000l];
//        //                NSLog(@"add value ");
//        ////                [obj setValue:@"123456" forKey:key];
//        //            }
//
//    }
}

@end
