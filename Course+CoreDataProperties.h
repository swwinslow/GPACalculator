//
//  Course+CoreDataProperties.h
//  GPACalculator
//
//  Created by Seth Winslow on 6/12/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Course.h"

NS_ASSUME_NONNULL_BEGIN

@interface Course (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *courseName;
@property (nullable, nonatomic, retain) NSString *courseGrade;
@property (nullable, nonatomic, retain) NSNumber *courseCredit;

@end

NS_ASSUME_NONNULL_END
