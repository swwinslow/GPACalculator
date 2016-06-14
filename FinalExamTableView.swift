//
//  FinalExamTableView.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/4/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit

class FinalExamTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var orginalScore: Double = 0
    var finalExamWorth: Double = 0
    var finalCourseWorth: Double = 0
    
    var shoppingList: [String] = ["100", "95", "90", "85", "80", "75", "70", "65", "60"]
    var x: [String] = ["100 on Final", "95 on Final", "90 on Final", "85 on Final", "80 on Final", "75 on Final", "70 on Final", "65 on Final", "60 on Final"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        print(orginalScore)
        print(finalExamWorth)
        print(finalCourseWorth)
        
        var s:String = calculatePercentages(orginalScore, finalExam: finalExamWorth, percentage: 60)
        print(s)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
       // var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let cellIdentifier = "Cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! UITableViewCell!
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellIdentifier)
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            cell.textLabel!.text = self.shoppingList[indexPath.row] as? String
            cell.detailTextLabel?.text = self.x[indexPath.row] as? String
            cell.detailTextLabel?.textColor = UIColor.blueColor()
            
            
            // The expected data appear in the console, but not in the iOS simulator's table view cell.
            
        })
        return cell
        
        
    
       
    }
    
    func calculatePercentages(currentScore: Double, finalExam: Double, percentage: Double) -> String {
       
        
        let courseEvealuation = currentScore / 100
        
        print(courseEvealuation)
        
        let remainder:Double = (0.60 - courseEvealuation) * 100
        
        print(remainder)
        
        let value:Double = (remainder / finalExam)
        
        print(value)
        let x: Double = value * 100.0
        print(x)
        let str = NSString(format: "%.1f", x)
        print(str)
        
        if(x <= 0.00)
        {
            return String("You already achieved an \(percentage)")
        }
        else{
            
            return String("\(str)% on final to get 60%")
        }

        
        
        return ""
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    

}