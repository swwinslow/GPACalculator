//
//  Course+CoreDataProperties.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/17/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Course {

    @NSManaged var courseName: String?
    @NSManaged var courseCredit: String?
    @NSManaged var courseGrade: String?

}
