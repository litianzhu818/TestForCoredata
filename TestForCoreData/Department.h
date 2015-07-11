//
//  Department.h
//  TestForCoreData
//
//  Created by Peter Lee on 15/7/3.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student;

@interface Department : NSManagedObject

@property (nonatomic, retain) NSString * dpId;
@property (nonatomic, retain) NSString * dpName;
@property (nonatomic, retain) NSSet *dsShip;
@end

@interface Department (CoreDataGeneratedAccessors)

- (void)addDsShipObject:(Student *)value;
- (void)removeDsShipObject:(Student *)value;
- (void)addDsShip:(NSSet *)values;
- (void)removeDsShip:(NSSet *)values;

@end
