//
//  singleCourseDetails.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/25/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit
import CoreData

class SingleCourseDetails : UIViewController{
    
    @IBOutlet weak var courseNameTextbox: UITextField!
    
    @IBOutlet weak var courseCreditTextbox: UITextField!
    @IBOutlet weak var courseGradeTextbox: UITextField!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
     var singleCourse : Course?
    
    override func viewDidLoad() {
        if let c = singleCourse{
            courseNameTextbox.text = c.courseName
            courseGradeTextbox.text = c.courseGrade
            courseCreditTextbox.text = c.courseCredit
        }
    }
    
    
    
    @IBAction func saveCourse(sender: AnyObject) {
        
        if singleCourse == nil {
        
            let newCourse = NSEntityDescription.entityForName("Course", inManagedObjectContext: managedObjectContext)
        
            let singleCourse = Course(entity: newCourse!, insertIntoManagedObjectContext: managedObjectContext)
        
        }
        
        
        singleCourse?.courseName = courseNameTextbox.text
        singleCourse?.courseGrade = courseGradeTextbox.text
        singleCourse?.courseCredit = courseCreditTextbox.text
        var error: NSError?
        
        do{
            try managedObjectContext.save()
        } catch {
            let alert = UIAlertView(title: "Alert", message: "There is an error saving", delegate: nil, cancelButtonTitle: "Try again")
        }
        
        print("It worked")
        
        
        
    }
}
