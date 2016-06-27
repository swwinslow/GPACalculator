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
    
     var oldCourse : Course?
    
    override func viewDidLoad() {
        self.navigationItem.title = "Single Course"
        if let c = oldCourse{
            courseNameTextbox.text = c.courseName
            courseGradeTextbox.text = c.courseGrade
            courseCreditTextbox.text = c.courseCredit
        }
    }
    
    func checkInformation()-> Bool {
        
        var creditBoolean: Bool
        
        var gradeBoolean: Bool
        
        var nameBoolean: Bool
        
        var checkCredit: String = courseCreditTextbox.text!
        var num = Int(checkCredit)
        if num != nil {
            creditBoolean = true
        }
        else {
            
            creditBoolean = false

        }
    
    
 
        var name: String = courseNameTextbox.text!
        
        if name != ""{
            nameBoolean =  true
        } else {
            
            nameBoolean =  false
        }
        
        var grade: String = courseGradeTextbox.text!
        if grade == "A+" || grade == "A" || grade == "A-" || grade == "B+" || grade == "B" ||
            grade == "B-" || grade == "C+" || grade == "C" || grade == "C-" || grade == "D+" || 
            grade == "D" || grade == "D-" || grade == "F" {
            gradeBoolean =  true
        } else {
            
            gradeBoolean = false
        }
        
        
        if(creditBoolean == false && gradeBoolean == false && nameBoolean == false){
            let alert = UIAlertView(title: "Error", message: "Please enter all Information", delegate: nil, cancelButtonTitle: "Try again")
            
            alert.show()
            return false
            
        } else if (creditBoolean == false && nameBoolean == false) {
            let alert = UIAlertView(title: "Error", message: "Please enter a name and credits", delegate: nil, cancelButtonTitle: "Try again")
            
            alert.show()
            return false
        } else if (creditBoolean == false && gradeBoolean == false){
        let alert = UIAlertView(title: "Error", message: "Please enter a grade and credits", delegate: nil, cancelButtonTitle: "Try again")
        
            alert.show()
            return false
        } else if (gradeBoolean == false && nameBoolean == false){
            let alert = UIAlertView(title: "Error", message: "Please enter a grade and name", delegate: nil, cancelButtonTitle: "Try again")
            
            alert.show()
            return false
            
        } else if (gradeBoolean == false){
            let alert = UIAlertView(title: "Error", message: "Please enter a grade", delegate: nil, cancelButtonTitle: "Try again")
            
            alert.show()
            return false
        } else if (nameBoolean == false){
            let alert = UIAlertView(title: "Error", message: "Please enter a name", delegate: nil, cancelButtonTitle: "Try again")
            
            alert.show()
            return false
        } else if (creditBoolean == false){
            let alert = UIAlertView(title: "Error", message: "Please enter the credits", delegate: nil, cancelButtonTitle: "Try again")
            
            alert.show()
            return false
        } else {
            return true
        }
    
    
       
}


        
      
        
    
    
    
    @IBAction func saveCourse(sender: AnyObject) {
        
        var isCorrectInformation: Bool = checkInformation()
        
        if(isCorrectInformation == true){
            
        
        
        if oldCourse == nil {
        
            let newCourse = NSEntityDescription.entityForName("Course", inManagedObjectContext: managedObjectContext)
        
            oldCourse = Course(entity: newCourse!, insertIntoManagedObjectContext: managedObjectContext)
        
        }
        
        
        oldCourse?.courseName = courseNameTextbox.text!
        oldCourse?.courseGrade = courseGradeTextbox.text!
        oldCourse?.courseCredit = courseCreditTextbox.text!
        
        var error: NSError?
        
        do{
            try managedObjectContext.save()
        } catch {
            let alert = UIAlertView(title: "Alert", message: "There is an error saving", delegate: nil, cancelButtonTitle: "Try again")
        }
        
          
            let alert = UIAlertView(title: "Success", message: "Course Updated", delegate: nil, cancelButtonTitle: "Done")
            
            alert.show()
            
        }
        
        
    }
}
