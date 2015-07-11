//
//  ViewController.m
//  TestForCoreData
//
//  Created by Peter Lee on 14/10/24.
//  Copyright (c) 2014年 Peter Lee. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Student.h"
#import "Department.h"
#import "Course.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    [self test10WithAppdelegate:appDelegate];
}

- (void)test2WithAppdelegate:(AppDelegate *)appDelegate
{
    NSManagedObjectContext *moc = [appDelegate managedObjectContext];
    
    NSString *entityName = NSStringFromClass([Department class]);
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:moc];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:500];
    
    NSArray *allDepartments = [moc executeFetchRequest:fetchRequest error:nil];
    
    [allDepartments enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        Department *object = (Department *)obj;
        
        NSLog(@"==>%@==>%@",object.dpId,object.dpName);
        
        [object.dsShip enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
            
            Student *student = (Student *)obj;
            
            NSLog(@"==>%@==>%@==>%@",student.sId,student.sName,student.sdShip.dpId);
            
            [student.sCShip enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
                
                Course *course = (Course *)obj;
                
                NSLog(@"==>%@==>%@",course.cId,course.cName);
            }];
        }];
        
    }];

}

- (void)test3WithAppdelegate:(AppDelegate *)appDelegate
{
    NSManagedObjectContext *moc = [appDelegate managedObjectContext];
    
    NSString *entityName = NSStringFromClass([Student class]);
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:moc];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:500];
    

    NSArray *allStudents = [moc executeFetchRequest:fetchRequest error:nil];
    
    [allStudents enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        Student *student = (Student *)obj;
        
        NSLog(@"==>%@==>%@==>%@",student.sId,student.sName,student.sdShip.dpId);
        
    }];
}

- (void)test4WithAppdelegate:(AppDelegate *)appDelegate
{
    NSManagedObjectContext *moc = [appDelegate managedObjectContext];
    
    NSString *entityName = NSStringFromClass([Department class]);
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:moc];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K != %@",@"dpId", @"1"];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:500];
    [fetchRequest setPredicate:predicate];
    
    NSArray *allDepartments = [moc executeFetchRequest:fetchRequest error:nil];
    
    [allDepartments enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        [moc deleteObject:obj];
    }];
    
    [appDelegate saveContext];
}


- (void)test5WithAppdelegate:(AppDelegate *)appDelegate
{
    NSManagedObjectContext *moc = [appDelegate managedObjectContext];
    
    NSString *entityName = NSStringFromClass([Student class]);
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:moc];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K != %@",@"sId", @"student1"];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:500];
    [fetchRequest setPredicate:predicate];
    
    NSArray *allStudents = [moc executeFetchRequest:fetchRequest error:nil];
    
    [allStudents enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        [moc deleteObject:obj];
    }];
    
    [appDelegate saveContext];
}

- (void)test6WithAppdelegate:(AppDelegate *)appDelegate
{
    NSManagedObjectContext *moc = [appDelegate managedObjectContext];
    
    NSString *entityName = NSStringFromClass([Student class]);
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:moc];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@",@"sId", @"student1"];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:1];
    [fetchRequest setPredicate:predicate];
    
    NSArray *allStudents = [moc executeFetchRequest:fetchRequest error:nil];
    
    Student *student = [allStudents lastObject];
    
    student.sName = @"李天柱";
    
    [appDelegate saveContext];
}

- (void)test7WithAppdelegate:(AppDelegate *)appDelegate
{
    NSManagedObjectContext *moc = [appDelegate managedObjectContext];
    
    NSString *entityName = NSStringFromClass([Department class]);
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:moc];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@",@"dpId", @"1"];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:1];
    [fetchRequest setPredicate:predicate];
    NSArray *allDepartments = [moc executeFetchRequest:fetchRequest error:nil];
    
    Department *department = [allDepartments lastObject];
    
    for (Student *student in [[department dsShip] allObjects]) {
        [moc deleteObject:student];
    }
    
    [appDelegate saveContext];
}

- (void)test8WithAppdelegate:(AppDelegate *)appDelegate
{
    NSManagedObjectContext *moc = [appDelegate managedObjectContext];
    
    NSString *entityName = NSStringFromClass([Student class]);
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:moc];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"NOT(%K IN %@)",@"sId", [NSMutableArray array]];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:1];
    [fetchRequest setPredicate:predicate];
    
    
    NSArray *allStudents = [moc executeFetchRequest:fetchRequest error:nil];
    
    
    for (Student *student in allStudents) {
        NSLog(@"student name:%@",student.sName);
    }
    
    [appDelegate saveContext];
}

- (void)test9WithAppdelegate:(AppDelegate *)appDelegate
{
    NSManagedObjectContext *moc = [appDelegate managedObjectContext];
    
    NSString *entityName = NSStringFromClass([Course class]);
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:moc];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"cSShip.sdShip.dpId == %@ AND cId == %@",@"1", @"course1"];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    //[fetchRequest setFetchBatchSize:1];
    [fetchRequest setPredicate:predicate];
    
    
    NSArray *allCourses = [moc executeFetchRequest:fetchRequest error:nil];
    
    
    for (Course *course in allCourses) {
        NSLog(@"student name:%@",course.cSShip.sName);
    }
    
    [appDelegate saveContext];
}

- (void)test10WithAppdelegate:(AppDelegate *)appDelegate
{
    NSManagedObjectContext *moc = [appDelegate managedObjectContext];
    
    NSString *entityName = NSStringFromClass([Department class]);
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:moc];
    
    //NSPredicate *predicate = [NSPredicate predicateWithFormat:@"dpId == %@",@"2"];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];
    //[fetchRequest setFetchBatchSize:1];
    //[fetchRequest setPredicate:predicate];
    [fetchRequest setResultType:NSDictionaryResultType];
    
    NSAttributeDescription *dpNameDescription = [entity.attributesByName objectForKey:@"dpName"];
    
    
    // Get the count of users...
    NSExpression *keyPathExpression = [NSExpression expressionForKeyPath: @"dsShip"]; // Does not really matter
    NSExpression *ptNameExpression = [NSExpression expressionForFunction: @"count:" arguments: [NSArray arrayWithObject:keyPathExpression]];
    NSExpressionDescription *expressionDescription = [[NSExpressionDescription alloc] init];
    [expressionDescription setName: @"ptUserCount"];
    [expressionDescription setExpression: ptNameExpression];
    [expressionDescription setExpressionResultType: NSInteger32AttributeType];
    
    [fetchRequest setPropertiesToFetch:@[dpNameDescription,expressionDescription]];
    
    // setting the groupby value
    [fetchRequest setPropertiesToGroupBy:@[dpNameDescription]];
    
    
    NSDictionary *allCourses = [moc executeFetchRequest:fetchRequest error:nil];
    
    
    for (NSDictionary *dic in allCourses) {
        NSLog(@"student name:%@",dic.description);
    }
    
    [appDelegate saveContext];
}


- (void)test1WithAppdelegate:(AppDelegate *)appDelegate
{
    NSManagedObjectContext *moc = [appDelegate managedObjectContext];
    
    NSString *entityNamec = NSStringFromClass([Course class]);
    NSString *entityNames = NSStringFromClass([Student class]);
    NSString *entityNamed = NSStringFromClass([Department class]);
    // 3个部门
    Department *d1 = [NSEntityDescription insertNewObjectForEntityForName:entityNamed
                                                   inManagedObjectContext:moc];
    d1.dpId = @"1";
    d1.dpName = @"测试1";
    
    Department *d2 = [NSEntityDescription insertNewObjectForEntityForName:entityNamed
                                                   inManagedObjectContext:moc];
    d2.dpId = @"2";
    d2.dpName = @"测试2";
    
    Department *d3 = [NSEntityDescription insertNewObjectForEntityForName:entityNamed
                                                   inManagedObjectContext:moc];
    d3.dpId = @"3";
    d3.dpName = @"测试3";
    
    // 8个学生
    Student *s1 = [NSEntityDescription insertNewObjectForEntityForName:entityNames
                                                inManagedObjectContext:moc];
    s1.sId = @"student1";
    s1.sName = @"studentname1";
    
    Student *s2 = [NSEntityDescription insertNewObjectForEntityForName:entityNames
                                                inManagedObjectContext:moc];
    s2.sId = @"student2";
    s2.sName = @"studentname2";
    
    Student *s3 = [NSEntityDescription insertNewObjectForEntityForName:entityNames
                                                inManagedObjectContext:moc];
    s3.sId = @"student3";
    s3.sName = @"studentname3";
    
    Student *s4 = [NSEntityDescription insertNewObjectForEntityForName:entityNames
                                                inManagedObjectContext:moc];
    s4.sId = @"student4";
    s4.sName = @"studentname4";
    
    Student *s5 = [NSEntityDescription insertNewObjectForEntityForName:entityNames
                                                inManagedObjectContext:moc];
    s5.sId = @"student5";
    s5.sName = @"studentname5";
    
    
    Student *s6 = [NSEntityDescription insertNewObjectForEntityForName:entityNames
                                                inManagedObjectContext:moc];
    s6.sId = @"student6";
    s6.sName = @"studentname6";
    
    Student *s7 = [NSEntityDescription insertNewObjectForEntityForName:entityNames
                                                inManagedObjectContext:moc];
    s7.sId = @"student7";
    s7.sName = @"studentname7";
    
    Student *s8 = [NSEntityDescription insertNewObjectForEntityForName:entityNames
                                                inManagedObjectContext:moc];
    s8.sId = @"student8";
    s8.sName = @"studentname8";
    
    // 9们课程
    Course *c1 = [NSEntityDescription insertNewObjectForEntityForName:entityNamec
                                               inManagedObjectContext:moc];
    c1.cId = @"course1";
    c1.cName = @"语文";
    
    Course *c2 = [NSEntityDescription insertNewObjectForEntityForName:entityNamec
                                               inManagedObjectContext:moc];
    c2.cId = @"course2";
    c2.cName = @"数学";
    
    Course *c3 = [NSEntityDescription insertNewObjectForEntityForName:entityNamec
                                               inManagedObjectContext:moc];
    c3.cId = @"course3";
    c3.cName = @"英语";
    
    Course *c4 = [NSEntityDescription insertNewObjectForEntityForName:entityNamec
                                               inManagedObjectContext:moc];
    c4.cId = @"course4";
    c4.cName = @"物理";
    
    Course *c5 = [NSEntityDescription insertNewObjectForEntityForName:entityNamec
                                               inManagedObjectContext:moc];
    c5.cId = @"course5";
    c5.cName = @"生物";
    
    Course *c6 = [NSEntityDescription insertNewObjectForEntityForName:entityNamec
                                               inManagedObjectContext:moc];
    c6.cId = @"course6";
    c6.cName = @"政治";
    
    Course *c7 = [NSEntityDescription insertNewObjectForEntityForName:entityNamec
                                               inManagedObjectContext:moc];
    c7.cId = @"course7";
    c7.cName = @"地理";
    
    Course *c8 = [NSEntityDescription insertNewObjectForEntityForName:entityNamec
                                               inManagedObjectContext:moc];
    c8.cId = @"course8";
    c8.cName = @"历史";
    
    Course *c9 = [NSEntityDescription insertNewObjectForEntityForName:entityNamec
                                               inManagedObjectContext:moc];
    c9.cId = @"course9";
    c9.cName = @"化学";
    
    [s1 addSCShip:[NSSet setWithObjects:c1, nil]];
    [s2 addSCShip:[NSSet setWithObjects:c3, nil]];
    [s3 addSCShip:[NSSet setWithObjects:c4, nil]];
    [s4 addSCShip:[NSSet setWithObjects:c5,c9, nil]];
    [s5 addSCShip:[NSSet setWithObjects:c6, nil]];
    [s6 addSCShip:[NSSet setWithObjects:c7, nil]];
    [s7 addSCShip:[NSSet setWithObjects:c2, nil]];
    [s8 addSCShip:[NSSet setWithObjects:c8, nil]];
    
    [d1 addDsShipObject:s1];
    [d1 addDsShipObject:s2];
    
    [d2 addDsShip:[NSSet setWithObjects:s3,s4,s5, nil]];
    
    [d3 addDsShip:[NSSet setWithObjects:s6,s7,s8, nil]];
    
    [appDelegate saveContext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//将本地日期字符串转为UTC日期字符串
//本地日期格式:2013-08-03 12:53:51
//可自行指定输入输出格式
-(NSString *)getUTCFormateLocalDate:(NSString *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *dateFormatted = [dateFormatter dateFromString:localDate];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
    return dateString;
}

//将UTC日期字符串转为本地时间字符串
//输入的UTC日期格式2013-08-03T04:53:51+0000
-(NSString *)getLocalDateFormateUTCDate:(NSString *)utcDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:localTimeZone];
    
    NSDate *dateFormatted = [dateFormatter dateFromString:utcDate];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
    return dateString;
}

- (NSString *)getUTCFormatDate:(NSDate *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    NSString *dateString = [dateFormatter stringFromDate:localDate];
    return dateString;
}

- (NSDate *)getLocalFromUTC:(NSString *)utc
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *ldate = [dateFormatter dateFromString:utc];
    return ldate;
}

//NSString 2 NSDate
- (NSDate *)stringToDate:(NSString *)strdate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *retdate = [dateFormatter dateFromString:strdate];
    return retdate;
}

//NSDate 2 NSString
- (NSString *)dateToString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}


@end
