//
//  singleCourseDetails.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/25/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

// todo: look at updating the value of the grade if it is alreay set
// look at getting rid of the x on the textfields

import UIKit
import CoreData

class SingleCourseDetails : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    // TEXT BOX FOR DATA
    @IBOutlet weak var courseNameTextbox: UITextField!
    @IBOutlet weak var courseCreditTextbox: UITextField!
    
    // TEXT BOX WITH THE PICKER VIEWS
    @IBOutlet weak var courseGradeTextbox: UITextField!
    @IBOutlet weak var courseExtraTextBox: UITextField!
    
    // PICKER VIEWS
    var gradePickerView = UIPickerView()
    var extraPickerView = UIPickerView()
    
    //ARRAYS FOR THE PICKER VIEWS
    var gradeArray = ["A+",  "A","A-", "B+", "B", "B-", "C+","C", "C-", "D+", "D", "D-", "F"]
    var extraArray = ["N/A","AP", "Honors"]
    
    // TRACK THE EDUCATION TYPE THAT WAS PICKED
    var education:String = ""
    
    // CORE DATA
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    // HIGH SCHOOL AND COLLEGE SINGLE CORE DATA
    var oldCourse : Course?
    var oldHighSchoolCourse : HSCourse?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SETTING THE PICKER VIEWS TO THE TEXT FIELD
        self.gradePickerView = UIPickerView()
        self.extraPickerView = UIPickerView()
        self.gradePickerView.delegate = self
        self.extraPickerView.delegate = self
        self.courseGradeTextbox.inputView = self.gradePickerView
        self.courseExtraTextBox.inputView = self.extraPickerView
        gradePickerView.tag = 0
        extraPickerView.tag = 1
        
        

        // SETTING THE TITLE OF THE VIEW
        self.navigationItem.title = "Single Course"
        
        // IF THE EDUCATION IS COLLEGE
        if education == "College GPA"{
            
            // SETTING THE TEXTBOX OF THE GRADEE
            self.courseExtraTextBox.text = "N/A"
            self.courseGradeTextbox.text = "A+"
            
            // SEE IF PULLING IN SINGLE COLLEGE DATA COURSE
            if let c = oldCourse{
                courseNameTextbox.text = c.courseName
                courseGradeTextbox.text = c.courseGrade
                courseCreditTextbox.text = c.courseCredit
            }
            
            // DISABLE THE COURSE EXTRA TEXT FIELD
            courseExtraTextBox.userInteractionEnabled = false
            courseExtraTextBox.backgroundColor = UIColor.lightGrayColor()
            courseExtraTextBox.text = "N/A"
        }
        
        // IF THE EDUCATION IS HIGH SCHOOL
        if education == "HS GPA"{
            
            // SETTING THE TEXT FIELD 
            
            // SEE IF PULLING IN SINLGE HIGH SCHOOL DATA COURSE
            if let hs = oldHighSchoolCourse{
                courseNameTextbox.text = hs.courseName
                courseGradeTextbox.text = hs.courseGrade
                courseCreditTextbox.text = hs.courseCredit
                courseExtraTextBox.text = hs.courseExtra
            }
            
            // DISABLE THE COURSE CREDIT TEXTBOX
            courseCreditTextbox.userInteractionEnabled = false;
            courseCreditTextbox.text = "1"
            courseCreditTextbox.backgroundColor = UIColor.lightGrayColor()
        }
    }
    
    // PICKER VIEW INFORMATION
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        // IF THE TAG IS 0 => GRADING ARRAY
        if pickerView.tag == 0 {
            return gradeArray.count
        }
        
        // IF THE TAG IS 1 => EXTRA ARRAY
        if pickerView.tag == 1 {
            return extraArray.count
        }
        // FAIL BACK TO GRADE ARRAY
        return 1
    }
   
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // IF THE TAG IS 0 => GRADING ARRAY
        if pickerView.tag == 0 {
            return gradeArray[row]
        }
        
        // IF THE TAG IS 1 => EXTRA ARRAY
        if pickerView.tag == 1 {
            return extraArray[row]
        }
        
        // FAIL BACK TO GRADE ARRAY
        return gradeArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // IF THE TAG IS 0 => GRADE ARRAY
        if pickerView.tag == 0 {
            courseGradeTextbox.text = gradeArray[row]
        }
        
        // IF THE TAG IS 1 => EXTRA ARRAY
        if pickerView.tag == 1 {
            courseExtraTextBox.text = extraArray[row]
        }
    }
    
    // CHECK ALL THE INFOMATION THAT WAS COLLECTED
    // IF THE RETURN IS TRUE => ALL VALUES ARE GOOD TO GO
    func isInformationCorrect()-> Bool {
        
         // BOOLEAN TO TELL IF EACH VALUE IS READY TO BE SUBMITTED
        var creditBoolean: Bool
        var gradeBoolean: Bool
        var nameBoolean: Bool
        var extraBoolean: Bool
        
        // CHECKING THE CREDIT OF THE COURSE
        var creditString: String = courseCreditTextbox.text!
        var creditNumber = Int(creditString)
        if creditNumber != nil {

            creditBoolean = true
        }
        else {
            
            creditBoolean = false
        }
    
        // CHECKING THE NAME OF THE COURSE
        var name: String = courseNameTextbox.text!
        if name != ""{
            
            // AS LONG AS THE NAME HAS SOMETHING IN IT
            nameBoolean =  true
        } else {
            
            nameBoolean =  false
        }
        
        // CHECKING THE GRADE OF THE COURSE
        var gradeString: String = courseGradeTextbox.text!
        
        // IF THE GRADE STRING IS VALID => TRUE
        if gradeString == "A+" || gradeString == "A" || gradeString == "A-" || gradeString == "B+" || gradeString == "B" ||
            gradeString == "B-" || gradeString == "C+" || gradeString == "C" || gradeString == "C-" || gradeString == "D+" ||
            gradeString == "D" || gradeString == "D-" || gradeString == "F" {
            gradeBoolean =  true
        } else {
            
            gradeBoolean = false
        }
        
        // CHECKING THE VALUE OF THE EXTRA
        var extraString: String = courseExtraTextBox.text!
        
        // IF THE EXTRA STRING IS SET TO SOMETHING VALID
        if extraString == "N/A" || extraString == "AP" || extraString == "Honors"{
            extraBoolean = true
        } else {
            
            extraBoolean = false
        }
        
        
        // ISSUES THE ALERTS IF A VALUE IS MISSING FROM THE COURSE DETAILS
        
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

    // SENDING BACK THE EDUCATION TO THE LAST VIEW CONTROLLER
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if let viewController = viewController as? CourseTableViewController {
           viewController.education = education
        }
    }

    // BUTTON TO SAVE THE COURSE INFORMATION
    @IBAction func saveCourse(sender: AnyObject) {
        
        // SENDING ALL OF THE INFORMATION TO FUNCTION
        // IF BOOLEAN IS TRUE; ALL INFORMATION IS TRUE
        var isCorrectInformation: Bool = isInformationCorrect()
        
        if(isCorrectInformation == true){
        
            // IF WER ARE ADDING TO COLLEGE DATA
            if education == "College GPA"
            {
                // CHECKING TO SEE IF THE THIS IS NEW OR OLD COURSE
                if oldCourse == nil {
        
                let newCourse = NSEntityDescription.entityForName("Course", inManagedObjectContext: managedObjectContext)
        
                oldCourse = Course(entity: newCourse!, insertIntoManagedObjectContext: managedObjectContext)
        
                }
        
                // SETTING THAT INFORMATION TO THE COLLEGE DATA
                oldCourse?.courseName = courseNameTextbox.text!
                oldCourse?.courseGrade = courseGradeTextbox.text!
                oldCourse?.courseCredit = courseCreditTextbox.text!
                oldCourse?.courseExtra = "YES"
            
                // INIT AN ERROR WITH SAVING
                var error: NSError?
            
                // SAVING THE COURSE TO THE CORE DATA
                do{
                    // TRY AND SAVE THE DATA
                    try managedObjectContext.save()
                    
                    // THE DATA WAS A SUCCESS; ISSUE AN ALERT TO THE USER
                    let alert = UIAlertView(title: "Success", message: "Course Updated", delegate: nil, cancelButtonTitle: "Done")
                    alert.show()
                    
                } catch {
                    // IF THE DATA COULD NOT BE SAVED THE ISSUE ALERT
                    let alert = UIAlertView(title: "Alert", message: "There is an error saving", delegate: nil, cancelButtonTitle: "Try again")
                    alert.show()
                }
            }
    
            // IF WE ARE ADDING TO HIGH SCHOOL DATA
            if education == "HS GPA"{
                
                // IF WE ARE ADDING TO THE HIGH SCHOOL DATA
                if oldHighSchoolCourse == nil {
                
                    // CHECKING TO SEE IF THE THIS IS NEW OR OLD COURSE
                    let newCourse = NSEntityDescription.entityForName("HSCourse", inManagedObjectContext: managedObjectContext)
                
                    oldHighSchoolCourse = HSCourse(entity: newCourse!, insertIntoManagedObjectContext: managedObjectContext)
                
                }
            
                // SETTING THAT INFORMATION TO THE HIGH SCHOOL DATA
                oldHighSchoolCourse?.courseName = courseNameTextbox.text!
                oldHighSchoolCourse?.courseGrade = courseGradeTextbox.text!
                oldHighSchoolCourse?.courseCredit = "1"
                oldHighSchoolCourse?.courseExtra = courseExtraTextBox.text!
                
                // INIT AN ERROR WITH SAVING
                var error: NSError?
            
                // SAVING THE COURSE TO THE CORE DATA
                do{
                    // TRY AND SAVE THE DATA
                    try managedObjectContext.save()
                    
                    // THE DATA WAS A SUCCESS; ISSUE AN ALERT TO THE USER
                    let alert = UIAlertView(title: "Success", message: "Course Updated", delegate: nil, cancelButtonTitle: "Done")
                    alert.show()
                    
                } catch {
                    // IF THE DATA COULD NOT BE SAVED THE ISSUE ALERT
                    let alert = UIAlertView(title: "Alert", message: "There is an error saving", delegate: nil, cancelButtonTitle: "Try again")
                    alert.show()
                }
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
            print(HighSchoolCourse.first?.courseExtra)
        }
    }
}
