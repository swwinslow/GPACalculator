//
//  Course.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/12/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import Foundation
import CoreData

@objc(Course)


class Course: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    @NSManaged var className: String?
    @NSManaged var classCredit: String?
    @NSManaged var classGrade: String?
    
    

}
