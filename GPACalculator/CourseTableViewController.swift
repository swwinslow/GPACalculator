//
//  CourseTableViewController.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/25/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//



// TODO: LOOK AT THE COLOR OF THE BACKGROUND AND MAKE SURE THAT IT MATCHES AND THEN LOOK AT THE REQUEST METHOD FOR AN UIALERT IF GETTING THE DATA BACK FAILS

// SET AN UI ERROR IF THERE IS NO COUNT WITIN THE ARRAY
// SET AN UI ERROR IF YOU CAN NOT DELETE THE DATA

import UIKit
import CoreData

class CourseTableViewController: UITableViewController {
    
    // CORE DATAT INFORMATION
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    // CORE DATA FROM HIGH SCHOOL AND COLLEGE
    var courses = [Course]()
    var highSchoolCourse = [HSCourse]()
    
    // VARIABLE:
    
    //TO TRACK WHAT EDUCATION TYPE
    var education: String = ""
    
    //TO TRACK IF AP OR HONORS COURSE
    var labelAPCourse : String = "**"
    var labelHonorsCourse : String = "*"
    
    // ARRAYS FOR ADDING UP THE GPA
    var creditArray = [String]()
    var gradeArray = [String]()
    
    override func viewDidAppear(animated: Bool) {
        
        // SETTING THE NAVIAGATION TITLE
        self.navigationItem.title = education
     
        // REQUESTING THE DATA
        
        // INIT AN ERROR
        let error: NSError?
        
        // REQUESTING THE HIGH SCHOOL DATA
        if education == "HS GPA"{
            
            let request = NSFetchRequest(entityName: "HSCourse")
            
            do {
                // GETTING THE HIGH SCHOOL DATA AND PUTTING IT IN THE ARRAY
                highSchoolCourse = try managedObjectContext.executeFetchRequest(request) as! [HSCourse]
            } catch let error as NSError {
                // ALERT FOR AN ERROR GETTING THE DATA
                let alert = UIAlertView(title: "Error", message: "Could not get High School Data", delegate: nil, cancelButtonTitle: "Close")
                alert.show()
            }
            
            // RELOADING THE TABLE WITH THE NEW DATA
            self.tableView.reloadData()
        }
        
        // REQUESTING THE COLLEGE DATA
        if education == "College GPA"{
            
            let request = NSFetchRequest(entityName: "Course")
            
            do {
                // GETTING THE COLEEGE DATA AND PUTTING IT IN THE ARRAY
                courses = try managedObjectContext.executeFetchRequest(request) as! [Course]

            } catch let error as NSError {
                // ALERT FOR AN ERROR GETTING THE DATA
                let alert = UIAlertView(title: "Error", message: "Could not get College Data", delegate: nil, cancelButtonTitle: "Close")
                alert.show()
            }
            
            // RELOADING THE TABLE WITH THE NEW DATA
            self.tableView.reloadData()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewDidAppear(false)

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        
        // SETTING THE COLOR OF THE BACKGROUND TO RED
        self.tableView.backgroundColor = UIColor .redColor()
        
        //CLEARING THE ARRAYS
        creditArray.removeAll()
        gradeArray.removeAll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // TABLE FUNCTIONS
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // IF COLLEGE DATA THEN RETURN THE COLLEGE DATA COUNT;
        // IF HIGH SCHOOL DATA THEN RETURN THE HIGH SCHOOL DATA COUNT
        if education == "College GPA"{
            return courses.count
        } else if education == "HS GPA"{
            return highSchoolCourse.count
        }
        else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // CONFIGURE THE CUSTOMCELLTABLEVIEWCELL
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCellTableViewCell
        
        // IF THE EDUCATION IS COLLEGE; POPULATE THE CELLS WITH THE COLLEGE DATA
        if education == "College GPA"{
            
            // GETTING THE SINGLE COLLEGE COURSE
            let collegeSingleCourse = courses[indexPath.row]
        
            // GETTING EACH OF THE FIELDS TO THE COLLEGE DATA
            // NO NEED FOR EXTRA - BANNED FOR COLLEGE COURSE
            let className = collegeSingleCourse.courseName
            let classCredit = collegeSingleCourse.courseCredit
            let classGrade = collegeSingleCourse.courseGrade
            
            // ADDING THE CREDITS AND THE GRADES TO AN ARRAY TO CALCULATE THE GPA
            creditArray.append(classCredit!)
            gradeArray.append(classGrade!)
            
            // SETTING THE DATA WITH THE CORRECT CELL LABEL
            cell.className?.text = className
            cell.classGrade?.text = classGrade
            cell.classCredit?.text = classCredit
        }
        
        // IF THE EDUCATION IS HIGH SCHOOL; POPULATE THE CELLS WITH THE HIGH SCHOOL DATA
        if education == "HS GPA"{
            
            // GETTING THE SINGLE HIGH SCHOOL COURSE
            let highSchoolSingleCourse = highSchoolCourse[indexPath.row]
            
            // GETTING EACH OF THE FIELDS TO THE HIGH SCHOOL DATA
            let className = highSchoolSingleCourse.courseName
            var classCredit = highSchoolSingleCourse.courseCredit
            let classGrade = highSchoolSingleCourse.courseGrade
            let classExtra = highSchoolSingleCourse.courseExtra
            
            let isAPExtra : Bool = isAPCourse(classExtra!)
            let isHonorsExtra : Bool = isHonorsCourse(classExtra!)
            
            // ADDING THE CREDITS AND THE GRADES TO AN ARRAY TO CALCULATE THE GPA
            creditArray.append(classCredit!)
            gradeArray.append(classGrade!)
            
            // APPENDING HOURS TO THE CREDIT FIELD
            classCredit?.appendContentsOf(" Hours")
            
            // SINCE THE EXTRA FEILD IS ENABLED; SET A "*" FOR HONORS AND A "**" FOR AP
            if isAPExtra == true {
                classCredit?.appendContentsOf(labelAPCourse)
            } else if isHonorsExtra == true {
                classCredit?.appendContentsOf(labelHonorsCourse)
            }
            
            // SETTING THE DATA WITH THE CORRECT LABEL
            cell.className?.text = className
            cell.classGrade?.text = classGrade
            cell.classCredit?.text = classCredit
        }
        // RETURN THE CELL FOR EACH COURSE
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // DETELETE THE TABLE CELLS
        if editingStyle == .Delete {
            
            // IF THE EDUCATION IS COLLEGE; THEN DELETE THE COLLEGE COURSE
            if education == "College GPA" {
                
                // DELETE THE ROW FROM THE CORE DATA
                let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                let context:NSManagedObjectContext = appDel.managedObjectContext
                context.deleteObject(courses[indexPath.row])
                courses.removeAtIndex(indexPath.row)
            
                do {
                    try context.save()
                } catch _ {
                    
                    // SET UP AN ERROR
                }
                
                //  UPDATING THE TABLE VIEW
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
            
            // IF THE EDUCATION IS COLLEGE; THEN DELETE THE COLLEGE COURSE
            if education == "HS GPA"{
                
                // DELETE THE ROW FROM THE CORE DATA
                let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                let context:NSManagedObjectContext = appDel.managedObjectContext
                context.deleteObject(highSchoolCourse[indexPath.row])
                highSchoolCourse.removeAtIndex(indexPath.row)
                
                do {
                    try context.save()
                } catch _ {
                    
                    // SET UP AN ERROR

                }
                
                //  UPDATING THE TABLE VIEW
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        // IF THE IDENTIFIER IS GOING TO EDIT THE COURSE THAT WAS SELECTED
        if segue.identifier == "editCourse" {
            
            // IF THE EDUCATION IS COLLEGE; PUT THAT TO THE NEXT VIEW CONTROLLER
            if education == "College GPA"{
                
                let nextViewController = segue.destinationViewController as! SingleCourseDetails
                let indexPath = self.tableView.indexPathForSelectedRow
                let row = indexPath?.row
            
                nextViewController.oldCourse = courses[row!]
                nextViewController.education = education
            }
            
            // IF THE EDUCATION IS HIGH SCHOOL; PUT THAT TO THE NEXT VIEW CONTROLLER
            if education == "HS GPA"{
                let nextViewController = segue.destinationViewController as! SingleCourseDetails
                let indexPath = self.tableView.indexPathForSelectedRow
                let row = indexPath?.row
                
                // SETTING THE VALUES TO THE SINGLE VIEW CONTROLLER
                nextViewController.education = education
                nextViewController.oldHighSchoolCourse = highSchoolCourse[row!]
            }
        }
        
        // IF THE IDENTIFIER IS GOING TO CALCULATE THE COURSE
        if segue.identifier == "calc"{
            let nextViewController = segue.destinationViewController as! DisplayGPA
            calculateGPA()
            nextViewController.totalRawScore = calculateGPA().raw
            nextViewController.totalCredits = calculateGPA().credits
            nextViewController.education = education
        }
        
        // IF THE IDENTITIFER IS GOING TO ADD ANOTHER COURSE TO THE DATA
        if segue.identifier == "add"{
            let nextViewController = segue.destinationViewController as! SingleCourseDetails
            nextViewController.education = education
        }
    }
    
    // DETERMINE IF THE COURSE IS AN AP COURSE
    func isAPCourse(extra: String) -> Bool{
        if extra == "AP"{
            return true
        } else {
            return false
        }
    }
    
    // DETERMINE IF THE COURSE IS AN HONORS COURSE
    func isHonorsCourse(extra: String) -> Bool{
        if extra == "Honors"{
            return true
        } else {
            return false
        }
    }
    
    // FUNCTION TO START THE CALCULATIONS FOR THE GRADE POINT AVERAGE
    func calculateGPA() -> (credits: Double, raw: Double) {

        // SETTING THE RAW AND THE CREDIT VARIABLES
        var totalRaw: Double = 0.0
        var totalCredits: Double = 0.0

        // IF THE EDUCATION IS COLLEGE; PULL OUT OF THE DATA FOR COLLEGE
        if education == "College GPA"{
            
            // PULLING OUT EACH OF THE COURSE FROM THE CORE DATA
            for singleCourse in courses {
            
                // GETTING THE CREDIT HOUR FOR THE COURSE; TO DOUBLE
                let singleCreditHour: Double = Double(singleCourse.courseCredit!)!
                
                // GETTING THE GRADE FOR THE CORSE
                let singleGrade: String = singleCourse.courseGrade!
            
                let numbericGrade: Double = findNumberToGrade(singleGrade)
                let representCredit: Double = singleCreditHour
                let singleRawCourse: Double = numbericGrade * representCredit
            
                // ADDING THE RAW AND THE TOTAL CREDITS TO THE ARRAY
                totalRaw += singleRawCourse
                totalCredits += singleCreditHour
            }
        }
        
        // IF THE EDUCATION IS HIGH SCHOOL; PULL OUT OF THE DATA FOR HIGH SCHOOL
        if education == "HS GPA"{
            
            // PULLING OUT EACH OF THE COURSE FROM THE CORE DATA
            for singleCourse in highSchoolCourse {
                
                // GETTING THE CREDIT HOUR FOR THE COURSE; TO DOUBLE
                let singleCreditHour: Double = Double(singleCourse.courseCredit!)!
                let singleGrade: String = singleCourse.courseGrade!
                
                let numbericGrade: Double = findNumberToGrade(singleGrade)
                let representCredit: Double = singleCreditHour
                let singleRawCourse: Double = numbericGrade * representCredit
                
                // ADDING THE RAW AND THE TOTAL CREDITS TO THE ARRAY
                totalRaw += singleRawCourse
                totalCredits += singleCreditHour
            }
        }
        // RETURNING THE TOTAL CREDITS AND THE TOTAL RAW SCORE
        return (totalCredits, totalRaw)
    }
    
    func findNumberToGrade(grade: String)-> Double{
        
        // CALCULATE THE NUMERICA VALUE FOR EACH GRADE
        if(grade == "A+"){
            if education == "HS GPA"{
                return 4.33
            } else if education == "College GPA"{
                return 4.0
            }
        }
        if(grade == "A"){
            return 4.0
        }
        if(grade == "A-"){
            return 3.667
        }
        if(grade == "B+"){
            return 3.33
        }
        if(grade == "B"){
            return 3.0
        }
        if(grade == "B-"){
            return 2.667
        }
        if(grade == "C+"){
            return 2.33
        }
        if(grade == "C"){
            return 2
        }
        if(grade == "C-"){
            return 1.667
        }
        if(grade == "D+"){
            return 1.333
        }
        if(grade == "D"){
            return 1
        }
        if(grade == "D-"){
            return 0.667
        }
        if(grade == "F"){
            return 0.0
            
        }
        return 0.0
    }
}
