//
//  Student.h
//  TestForCoreData
//
//  Created by Peter Lee on 15/7/3.
//  Copyright (c) 2015年 Peter Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course, Department;

@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * sId;
@property (nonatomic, retain) NSString * sName;
@property (nonatomic, retain) Department *sdShip;
@property (nonatomic, retain) NSSet *sCShip;
@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addSCShipObject:(Course *)value;
- (void)removeSCShipObject:(Course *)value;
- (void)addSCShip:(NSSet *)values;
- (void)removeSCShip:(NSSet *)values;

@end
