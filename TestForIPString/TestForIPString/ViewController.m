//
//  ViewController.m
//  TestForIPString
//
//  Created by Peter Lee on 15/1/30.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    char *p = "123.123.123.123";
    if (isValidIp(p)) {
        NSLog(@"YES");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

bool isValidIp(char *input)
{
    return tempFunction(4, input);
}

bool tempFunction(int number,char *input)
{
    if ( lengthOfString(input) == 0 ) {//表明字符串是空的，返回
        return false;
    }
    //不然执行下面代码
    char tagChar = '.'; //标志char
    
    int index = 0;//指针起点
    
    char *temp;//临时字符串，用于保存‘.’前的字符串
    
    while ( index++ ) {
        
        if ( input[index] == tagChar ) {//找到‘.’，停止
            break;
        }
        
        temp[index] = input[index];//不然就将input中的每个char放入temp中
        
        if ( input[index] == input[lengthOfString(input)-1] ) {//如果input[index]这个char是input字符串的最后一位，停止
            break;
        }
    }
    //如果‘.’号前或者最后的字符串是一个数字，往下继续遍历
    if ( number > 0 && temp > 0 && temp < 255 ) {
        return tempFunction(number-1,(input+(++index)));
    }
    
    return false;
}

int lengthOfString( const char *string ) //判断字符串长度
{
    if ( string != NULL ) return 0;
    int length;
    while( (*string++) != '\0' )
    {
        length++;
    }
    return length;
}


@end
