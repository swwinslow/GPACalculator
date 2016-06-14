//
//  FinalExamGrade.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 12/31/15.
//  Copyright © 2015 Seth Winslow. All rights reserved.
//

import UIKit
import iAd

class FinalExamGrade: UIViewController, ADBannerViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
   
    @IBOutlet weak var currentGradeTextBox: UITextField!
    @IBOutlet weak var finalWeightTextBox: UITextField!
    
    func calculate100() -> String{
        //final - 1)for the final... 2) for the course)
        let final = checkNumbers()
        let score = checkScore()
        
       
        
        let courseEvealuation = score / 100
        
        let remainder:Double = (1 - courseEvealuation) * 100
        
        let value:Double = (remainder / final.final)
        let x: Double = value * 100.0
        
        let str = NSString(format: "%.1f", x)
        
        if(x <= 0.00)
        {
            return String("You already achieved an 100%")
        }
        else{
            return String("\(str)% on final to get 100%")
        }
    }
    
    func calculate95() -> String{
        //final - 1)for the final... 2) for the course)
        let final = checkNumbers()
        let score = checkScore()
        
        let courseEvealuation = score  / 100
        
        let remainder:Double = (0.95 - courseEvealuation) * 100
        
        let value:Double = (remainder / final.final)
        let x: Double = value * 100.0
        
        let str = NSString(format: "%.1f", x)
        
        if(x <= 0.00)
        {
            return String("You already achieved an 95%")
        }
        else{
            return String("\(str)% on final to get 95%")        }
    }
    
    func calculate90() -> String{
        //final - 1)for the final... 2) for the course)
        let final = checkNumbers()
        let score = checkScore()
        
        let courseEvealuation = score / 100
        
        let remainder:Double = (0.90 - courseEvealuation) * 100
        
        let value:Double = (remainder / final.final)
        let x: Double = value * 100.0
        let str = NSString(format: "%.1f", x)
        
        if(x <= 0.00)
        {
            return String("You already achieved an 90%")
        }
        else{
            return String("\(str)% on final to get 90%")        }
    }
    
    func calculate85() -> String{
        //final - 1)for the final... 2) for the course)
        let final = checkNumbers()
        let score = checkScore()
        
        let courseEvealuation = score / 100
        let remainder:Double = (0.85 - courseEvealuation) * 100
        
        let value:Double = (remainder / final.final)
        let x: Double = value * 100.0
        
        let str = NSString(format: "%.1f", x)

        if(x <= 0.00)
        {
            return String("You already achieved an 85%")
        }
        else{
            return String("\(str)% on final to get 85%")        }
    }
    
    func calculate80() -> String{
        //final - 1)for the final... 2) for the course)
        let final = checkNumbers()
        let score = checkScore()
        
        let courseEvealuation = score / 100
        
        let remainder:Double = (0.80 - courseEvealuation) * 100
        
        let value:Double = (remainder / final.final)
        
        let x: Double = value * 100.0
        let str = NSString(format: "%.1f", x)
        
        if(x <= 0.00)
        {
            return String("You already achieved an 80%")
        }
        else{
            return String("\(str)% on final to get 80%")        }
    }
    
    func calculate75() -> String{
        //final - 1)for the final... 2) for the course)
        let final = checkNumbers()
        let score = checkScore()
        
        let courseEvealuation = score / 100
        
        let remainder:Double = (0.75 - courseEvealuation) * 100
        
        let value:Double = (remainder / final.final)
        let x: Double = value * 100.0
        let str = NSString(format: "%.1f", x)
       
        if(x <= 0.00)
        {
            return String("You already achieved an 75%")
        }
        else{
            return String("\(str)% on final to get 75%")        }
    }
    
    func calculate70() -> String{
        //final - 1)for the final... 2) for the course)
        let final = checkNumbers()
        let score = checkScore()
        
        let courseEvealuation = score / 100
        
        let remainder:Double = (0.70 - courseEvealuation) * 100
        
        let value:Double = (remainder / final.final)
        let x: Double = value * 100.0
        let str = NSString(format: "%.1f", x)
  
        if(x <= 0.00)
        {
            return String("You already achieved an 70%")
        }
        else{
            return String("\(str)% on final to get 70%")        }
    }
    
    func calculate65() -> String{
        //final - 1)for the final... 2) for the course)
        let final = checkNumbers()
        let score = checkScore()
        
        let courseEvealuation = score / 100
        let remainder:Double = (0.65 - courseEvealuation) * 100
        
        let value:Double = (remainder / final.final)
        let x: Double = value * 100.0
        let str = NSString(format: "%.1f", x)
        
        
        if(x <= 0.00)
        {
            return String("You already achieved an 65%")
        }
        else{
            return String("\(str)% on final to get 65%")        }
    }
    
    func calculate60() -> String{
        //final - 1)for the final... 2) for the course)
        let final = checkNumbers()
        let score = checkScore()
        
        let courseEvealuation = score / 100
        
        let remainder:Double = (0.60 - courseEvealuation) * 100
        
        let value:Double = (remainder / final.final)
        let x: Double = value * 100.0
        let str = NSString(format: "%.1f", x)
        
        if(x <= 0.00)
        {
            return String("You already achieved an 60%")
        }
        else{
            return String("\(str)% on final to get 60%")
        }
    }
    
    
    func checkScore() -> Double {
        
        let currentGrade = currentGradeTextBox.text
        
        var x:Bool = isNumeric(currentGrade!)
        if(currentGradeTextBox.text != "" && x == true){
            let currentGrade = currentGradeTextBox.text! as String
            let doubleCurrentScore:Double = Double(currentGrade)!
            
            if(doubleCurrentScore < 0 || doubleCurrentScore > 100 )
            {
                //needs to issue an alert about the low or the large number
            }
            else{
                return doubleCurrentScore
            }
        }
        else{
        
            
            let alertView = UIAlertController(title: "No Number", message: "The value you entered is not a number", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
        return 0.0
    }
    
    func isNumeric(a: String) -> Bool {
        return Double(a) != nil
    }
    
    
    func checkNumbers() ->(final: Double, course: Double){
        let number = finalWeightTextBox.text
  
        var x:Bool = isNumeric(number!)
        
        if(finalWeightTextBox.text != "" && x == true){
            let finalExamPercentage = finalWeightTextBox.text! as String
            let doubleFinalExamPercentage:Double = Double(finalExamPercentage)!
            
            if(doubleFinalExamPercentage < 0 || doubleFinalExamPercentage > 100 )
            {
                //needs to issue an alert about the low or the large number
            }
            else{
                let c:Double = 100.0 - doubleFinalExamPercentage
                return (doubleFinalExamPercentage, c)
            }
            
        }
        else{
            //alert for entering informaton into the textbox
            let alertView = UIAlertController(title: "No Number", message: "The value you entered is not a number", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)

        }
        
        return (0.0, 0.0)
        
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        

        var currentCourseScore:Double = checkScore()
        var score = checkNumbers()
        
        let nextView = segue.destinationViewController as! FinalExamTableView
        
        nextView.finalExamWorth = score.final
        nextView.finalCourseWorth = score.course
        nextView.orginalScore = currentCourseScore
        
//
//        nextView.currentGradeLabel.text = "Current Grade"
//        nextView.finalExamLabel.text = "Final Exam"
        
        
        
        
    }
    
   

    
    
    
}
