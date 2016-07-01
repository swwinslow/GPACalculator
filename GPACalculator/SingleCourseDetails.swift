//
//  singleCourseDetails.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/25/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit
import CoreData

class SingleCourseDetails : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var courseNameTextbox: UITextField!
    
    @IBOutlet weak var courseCreditTextbox: UITextField!
    @IBOutlet weak var courseGradeTextbox: UITextField!
    
    
    @IBOutlet weak var courseExtraTextBox: UITextField!
    var highSchoolPicker = ["A+",  "A","A-", "B+", "B", "B-", "C+","C", "C-", "D+", "D", "D-", "F"]
    
    var highSchoolPickerTypes = ["","(AP)", "(Hons)"]
    
    var didValueChange: String = "A+"
    var didValueChange1: String = ""
    var change: Bool = false
    var change1: Bool = false

    
    var education:String = ""
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
     var oldCourse : Course?
    var oldHighSchoolCourse : HSCourse?
    
    
    override func viewDidLoad() {
        
        courseExtraTextBox.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        
        self.navigationItem.title = "Single Course"
        
        if education == "College GPA"{
            
        
        if let c = oldCourse{
            courseNameTextbox.text = c.courseName
            courseGradeTextbox.text = c.courseGrade
            courseCreditTextbox.text = c.courseCredit
        }
            
        }
        
        if education == "HS GPA"{
            
            
            if let hs = oldHighSchoolCourse{
                courseNameTextbox.text = hs.courseName
                courseGradeTextbox.text = hs.courseGrade
                courseCreditTextbox.text = hs.courseCredit
            }
            courseCreditTextbox.userInteractionEnabled = false;
            courseCreditTextbox.text = "1"

            
        }
        
        var pickerView = UIPickerView()
        
        pickerView.delegate = self
        
        courseGradeTextbox.inputView = pickerView
        
        var pickerView2 = UIPickerView()
        
        pickerView2.delegate = self
        courseExtraTextBox.inputView  = pickerView
    }
    
    func textFieldDidChange(textField: UITextField)->Bool{
        return true
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if courseExtraTextBox.isFirstResponder(){
            return highSchoolPicker.count
        } else if courseGradeTextbox.isFirstResponder(){
            return highSchoolPicker.count
        } else {
            return 0
        }
    }
   
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if courseExtraTextBox.isFirstResponder(){
//            return highSchoolPickerTypes[row]
//        }
        if courseExtraTextBox.did{
            return highSchoolPicker[row]
        }
         else {
            return highSchoolPickerTypes[row]
        }
        
    }
    
    

    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        var part1: String = ""
        var part2: String = ""
        if (component == 0){
            change = true
            part1 =  highSchoolPicker[row]
            if(part1 == didValueChange){
                
            }else{
                didValueChange = part1
            }
        } else {
            part2 =  highSchoolPickerTypes[row]
            if(part2 == didValueChange1){
                
            }else{
                didValueChange1 = part2
            }

        }
        
        
        //todo LOOK AT THE CHANGE OF THE VALUE -> THEN LOOK AT SAVING THE OBJECT
        
        if part2 == "" && part1 == "" {
            courseGradeTextbox.text = didValueChange
        } else if (didValueChange1 == "") {
            courseGradeTextbox.text = part1 + " " + part2

        }
        change = false
        change1 = false
    }
    
    
    func checkInformation()-> Bool {
        
        var creditBoolean: Bool
        
        var gradeBoolean: Bool
        
        var nameBoolean: Bool
        
        var extraBoolean: Bool
        
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
        
        var extra: String = courseExtraTextBox.text!
        if extra != ""{
            // Making sure that it is the correct Extra that could be choosen
            if extra == "(AP)" || extra == "(Hons)"{
                extraBoolean = true
            } else {
                extraBoolean = false
            }
        } else {
            extraBoolean = true
        }
        
        
        if(creditBoolean == false && gradeBoolean == false && nameBoolean == false && extraBoolean == false){
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
            
        } else if (gradeBoolean == false && nameBoolean == false && extraBoolean == false){
            let alert = UIAlertView(title: "Error", message: "Please enter proper grade, name, and extra", delegate: nil, cancelButtonTitle: "Try again")
            
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

    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if let viewController = viewController as? CourseTableViewController {
           viewController.education = education
        }
    }

        
      
        
    
    
    
    @IBAction func saveCourse(sender: AnyObject) {
        
        var isCorrectInformation: Bool = checkInformation()
        
        if(isCorrectInformation == true){
            
            print(education)
            
        if education == "College GPA"
        {
        
        if oldCourse == nil {
        
            let newCourse = NSEntityDescription.entityForName("Course", inManagedObjectContext: managedObjectContext)
        
            oldCourse = Course(entity: newCourse!, insertIntoManagedObjectContext: managedObjectContext)
        
        }
        
        
        oldCourse?.courseName = courseNameTextbox.text!
        oldCourse?.courseGrade = courseGradeTextbox.text!
        oldCourse?.courseCredit = courseCreditTextbox.text!
        oldCourse?.courseExtra = "YES"
            
            var error: NSError?
            
            do{
                try managedObjectContext.save()
            } catch {
                let alert = UIAlertView(title: "Alert", message: "There is an error saving", delegate: nil, cancelButtonTitle: "Try again")
            }
            
            
            let alert = UIAlertView(title: "Success", message: "Course Updated", delegate: nil, cancelButtonTitle: "Done")
            
            alert.show()
            
        }
    
        if education == "HS GPA"{
            if oldHighSchoolCourse == nil {
                
                let newCourse = NSEntityDescription.entityForName("HSCourse", inManagedObjectContext: managedObjectContext)
                
                oldHighSchoolCourse = HSCourse(entity: newCourse!, insertIntoManagedObjectContext: managedObjectContext)
                
            }
            
            
            oldHighSchoolCourse?.courseName = courseNameTextbox.text!
            print(courseNameTextbox.text)
            oldHighSchoolCourse?.courseGrade = courseGradeTextbox.text!
            oldHighSchoolCourse?.courseCredit = courseCreditTextbox.text!
            oldHighSchoolCourse?.courseExtra = "YES"

            
            
            var error: NSError?
            
            do{
                try managedObjectContext.save()
            } catch {
                let alert = UIAlertView(title: "Alert", message: "There is an error saving", delegate: nil, cancelButtonTitle: "Try again")
            }
            
            
            let alert = UIAlertView(title: "Success", message: "Course Updated", delegate: nil, cancelButtonTitle: "Done")
            
            alert.show()
            
            }
            
            var HighSchoolCourse = [HSCourse]()
            
            let request = NSFetchRequest(entityName: "HSCourse")
            
            do {
                HighSchoolCourse = try managedObjectContext.executeFetchRequest(request) as! [HSCourse]
                // success ...
            } catch let error as NSError {
                // failure
                print("Fetch failed: \(error.localizedDescription)")
            }
            
            print(HighSchoolCourse.count)
            
            print(HighSchoolCourse.first?.courseName)
            print(HighSchoolCourse.first?.courseExtra)
            print(HighSchoolCourse.first?.courseGrade)

            
        }
    }
}
