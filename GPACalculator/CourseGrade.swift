//
//  CourseGrade.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/12/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit
import CoreData

class CourseGrade: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var course = [NSManagedObjectContext]()
    
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course.count;
    }
    
    override func viewDidLoad() {
        seedPerson()
    }
    
    
    func seedPerson() {
        
        // create an instance of our managedObjectContext
        let moc = DataController().managedObjectContext
        
        // we set up our entity by selecting the entity and context that we're targeting
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Course", inManagedObjectContext: moc) as! Course
        
        // add our data
        entity.setValue("Math", forKey: "courseName")
        entity.setValue("3 hours", forKey: "courseCredit")
        entity.setValue("A+", forKey: "courseGrade")
        
        // we save our entity
        do {
            try moc.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCellTableViewCell
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        let singleCourse = course[indexPath.row]
        cell.className.text = singleCourse.valueForKey("courseName") as? String
        cell.classCredit.text = singleCourse.valueForKey("courseCredit") as? String
        cell.classGrade.text = singleCourse.valueForKey("courseGrade") as? String
        
//        cell.className.text = course[indexPath.row]
//        cell.classGrade.text = grade[indexPath.row]
//        cell.classCredit.text = credit[indexPath.row]
        
//        cell.className.text = course[indexPath.row]
//        cell.classCredit.text = credit[indexPath.row]
//        cell.classGrade.text = grade[indexPath.row]
        
        
        
        return cell;
    }
}






