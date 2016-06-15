//
//  FinalExamTableView.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/4/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit

class FinalExamTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var currentGrade: UILabel!
    @IBOutlet weak var finalExamLabel: UILabel!
    var orginalScore: Double = 0
    var finalExamWorth: Double = 0
    var finalCourseWorth: Double = 0
    var addPercent: Double = 0
    
    var shoppingList: [Double] = [100, 95, 90, 85, 80, 75, 70, 65, 60]
    var x: [String] = ["100 on Final", "95 on Final", "90 on Final", "85 on Final", "80 on Final", "75 on Final", "70 on Final", "65 on Final", "60 on Final"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        print("This is the orginal score \(orginalScore)")
        currentGrade.text = "Current Grade: \(orginalScore)"
        finalExamLabel.text = "Final Exam: \(finalExamWorth)"
        self.navigationItem.title = "Final Exam"
        
        let shouldAddPercentage: Bool = shouldCheckArray()
        if(shouldAddPercentage == false){
            
        } else {
            addPercentage()
        }
        let s:String = calculatePercentages(orginalScore, finalExam: finalExamWorth, percentage: 60)
        print(s)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func shouldCheckArray() -> Bool{
        for item in shoppingList {
            let myDouble = Double(item)
            if(myDouble == self.addPercent){
                return false
            }
        }
        return true

    }
    func addPercentage(){
        
        self.shoppingList.append(addPercent)
        self.shoppingList = self.shoppingList.sort{
            return $0  > $1
        }

        
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
       // var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let cellIdentifier = "Cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell!
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellIdentifier)
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            if(self.shoppingList[indexPath.row] == self.addPercent){
                let percentString:String = String(format:"%.1f", self.shoppingList[indexPath.row])
                
                
                
                cell.textLabel!.text = percentString
                
                
                
                
                let xxx:String = self.calculatePercentages(self.orginalScore, finalExam: self.finalExamWorth, percentage: self.shoppingList[indexPath.row])
                //cell.detailTextLabel?.text = xxx
                cell.textLabel!.text = xxx
                
                let string: String = "\(percentString)%"
                
                cell.detailTextLabel?.text = string
                
                cell.detailTextLabel?.textColor = UIColor.redColor()
                cell.textLabel!.textColor = UIColor.redColor()
                
                
                // The expected data appear in the console, but not in the iOS simulator's table view cell.
                
            } else {
                let percentString:String = String(format:"%.1f", self.shoppingList[indexPath.row])
                
                
                
                cell.textLabel!.text = percentString
                
                
                
                
                let xxx:String = self.calculatePercentages(self.orginalScore, finalExam: self.finalExamWorth, percentage: self.shoppingList[indexPath.row])
                //cell.detailTextLabel?.text = xxx
                cell.textLabel!.text = xxx
                
                let string: String = "\(percentString)%"
                
                cell.detailTextLabel?.text = string
                
                cell.detailTextLabel?.textColor = UIColor.blueColor()

            }
            
            
            
        })
        return cell
        
        
    
       
    }
    
    func calculatePercentages(currentScore: Double, finalExam: Double, percentage: Double) -> String {
       
       
        let currentWeighi = 1 - (finalExam / 100)
        
        let courseEvealuation = ((currentScore / 100) * currentWeighi)
        
        
        
        let remainder:Double = (((percentage / 100.0) - courseEvealuation) * 100)
        

        
        let value:Double = (remainder / finalExam) * 100
        

        //let x: Double = value * 100.0

        let str = NSString(format: "%.1f", value)

        
        if(value <= 0.00)
        {
            return String("Achieved \(percentage)")
        }
        else{
            
            return String("\(str)% on final to achieve a -> ")
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    

}