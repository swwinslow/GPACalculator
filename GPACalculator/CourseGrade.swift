//
//  CourseGrade.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/12/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit
import CoreData

class CourseGrade: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    var course = ["hello", "this", "is"]
    
    @IBOutlet weak var tableView: UITableView!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    var fetchedResultsController: NSFetchedResultsController!
    
    
    
    override func viewDidLoad() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addCourse")
        
        
    }
    
    func addCourse(){
        course.append("Hello")
        print("we are here")
        self.tableView.reloadData()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            course.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            
        }
    }
    
   
    
    func saveData(){
        let appDelgation: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDelgation.managedObjectContext
        
        let newCourse = NSEntityDescription.insertNewObjectForEntityForName("Course", inManagedObjectContext: context)
        
        newCourse.setValue("Math 161", forKey: "courseName")
        newCourse.setValue("A+", forKey: "courseGrade")
        newCourse.setValue("3", forKey: "courseCredit")
        
        do{
            try context.save()
        } catch {
            print("Error")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as! CustomCellTableViewCell
        
        
      
        
        
        let singleCourse = self.course[indexPath.row]
        
        print(singleCourse)
        
       // cell.textLabel?.text = singleCourse
        cell.className.text = "Hey"
        cell.classGrade.text = "A+"

        cell.classCredit.text = "3 Hours"
        
        
        
        
        return cell;
    }
}






