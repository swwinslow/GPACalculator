//
//  CourseTableViewController.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/25/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit
import CoreData

class CourseTableViewController: UITableViewController {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    var courses = [Course]()
    var HighSchoolCourse = [HSCourse]()
    var education: String = ""
    
    var creditArray = [String]()
    var gradeArray = [String]()
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        self.navigationItem.title = education
        
        print(education)
        
        var error: NSError?
        
        
        //HIGH SCHOOL DATA
        if education == "HS GPA"{
            let request = NSFetchRequest(entityName: "HSCourse")
            
            do {
                HighSchoolCourse = try managedObjectContext.executeFetchRequest(request) as! [HSCourse]
                // success ...
            } catch let error as NSError {
                // failure
                print("Fetch failed: \(error.localizedDescription)")
            }
            self.tableView.reloadData()
            
            print(HighSchoolCourse.count)

        
        }
        
        //COLLEGE DATA
        if education == "College GPA"{
            let request = NSFetchRequest(entityName: "Course")
            
            do {
                courses = try managedObjectContext.executeFetchRequest(request) as! [Course]
                // success ...
            } catch let error as NSError {
                // failure
                print("Fetch failed: \(error.localizedDescription)")
            }
            self.tableView.reloadData()

        
        }
        
                print(courses.count)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewDidAppear(false)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.backgroundColor = UIColor .redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if education == "College GPA"{
            return courses.count
        }
        if education == "HS GPA"{
            return HighSchoolCourse.count
        }
        else {
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCellTableViewCell
        
      
     
        
        if education == "College GPA"{
            
        let course = courses[indexPath.row]
        
         var className = course.courseName
         var classCredit = course.courseCredit
         var classGrade = course.courseGrade
         var classExtra = course.courseExtra
            
            creditArray.append(classCredit!)
            gradeArray.append(classGrade!)
            
            cell.className?.text = className
            cell.classGrade?.text = classGrade
            cell.classCredit?.text = classCredit
        
        
        }
        
        if education == "HS GPA"{
            let highSchoolSingleCourse = HighSchoolCourse[indexPath.row]
            var className = highSchoolSingleCourse.courseName
            var classCredit = highSchoolSingleCourse.courseCredit
             var classGrade = highSchoolSingleCourse.courseGrade
             var classExtra = highSchoolSingleCourse.courseExtra
            
            creditArray.append(classCredit!)
            gradeArray.append(classGrade!)
            
            cell.className?.text = className
            cell.classGrade?.text = classGrade
            cell.classCredit?.text = classCredit
            
        }
        
      
        
        
        
       //
//        
//       LOOK AT THE COURSE EXTRA AND ADDING SOMETHING TO THE MARK
//        
//        
        
        
        //cell.className.textColor = UIColor.whiteColor()
        

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
        
        if editingStyle == .Delete {
            if education == "College GPA" {
                
            
            // Delete the row from the data source
            let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context:NSManagedObjectContext = appDel.managedObjectContext
            context.deleteObject(courses[indexPath.row])
            courses.removeAtIndex(indexPath.row)
            
            do {
                try context.save()
            } catch _ {
            }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }
            
            if education == "HS GPA"{
                
                
                // Delete the row from the data source
                let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                let context:NSManagedObjectContext = appDel.managedObjectContext
                context.deleteObject(HighSchoolCourse[indexPath.row])
                HighSchoolCourse.removeAtIndex(indexPath.row)
                
                do {
                    try context.save()
                } catch _ {
                }
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
           
            }
            

        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editCourse" {
            if education == "College GPA"{
                
            let nextViewController = segue.destinationViewController as! SingleCourseDetails
            let indexPath = self.tableView.indexPathForSelectedRow
            let row = indexPath?.row
            
            nextViewController.oldCourse = courses[row!]
                nextViewController.education = education

            }
            
            if education == "HS GPA"{
                let nextViewController = segue.destinationViewController as! SingleCourseDetails
                let indexPath = self.tableView.indexPathForSelectedRow
                let row = indexPath?.row
                
                
                nextViewController.education = education
                nextViewController.oldHighSchoolCourse = HighSchoolCourse[row!]
                nextViewController.education = education
            
            }
        }
        if segue.identifier == "calc"{
            let nextViewController = segue.destinationViewController as! DisplayGPA
            nextViewController.totalRawScore = calculateGPA().raw
            nextViewController.totalCredits = calculateGPA().credits
//            nextViewController.education = education
            
        }
        
        if segue.identifier == "add"{
            let nextViewController = segue.destinationViewController as! SingleCourseDetails
            nextViewController.education = education
        }
        
    }
    
    func calculateGPA() -> (credits: Double, raw: Double) {
        //caculate the GPA with the Core Data
        var totalRaw: Double = 0.0
        var totalCredits: Double = 0.0
        
        for singleCourse in courses {
            
            var singleCreditHour: Double = 0.0
           
            
             Double(singleCourse.courseCredit!)!
            var singleGrade: String = singleCourse.courseGrade!
            
            var representGrade: Double = findNumberToGrade(singleGrade)
            var representCredit: Double = singleCreditHour
            var singleRawCourse: Double = representGrade * representCredit
            
            totalRaw += singleRawCourse
            totalCredits += singleCreditHour
            
            
        }
        
        print(totalRaw)
        print(totalCredits)
        return (totalCredits, totalRaw)
        
        
    }
    
    func findNumberToGrade(grade: String)-> Double{
        if(grade == "A+"){
            return 4.0
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
