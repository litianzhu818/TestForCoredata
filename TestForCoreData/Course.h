//
//  Course.h
//  TestForCoreData
//
//  Created by Peter Lee on 15/7/3.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student;

@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * cId;
@property (nonatomic, retain) NSString * cName;
@property (nonatomic, retain) Student *cSShip;

@end
