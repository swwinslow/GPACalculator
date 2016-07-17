//
//  FinalExamGrade.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 12/31/15.
//  Copyright © 2015 Seth Winslow. All rights reserved.
//

// todo : String checking with the textboxes empty
// making sure that the % gets deleted and then added again
// look at the sendAlert function

import UIKit


class FinalExamGrade: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Final Exam"
    }
    
    @IBOutlet weak var percentage: UITextField!
    @IBOutlet weak var currentGradeTextBox: UITextField!
    @IBOutlet weak var finalWeightTextBox: UITextField!
    
    @IBAction func editingDidEndCurrentGrade(sender: AnyObject) {
        if currentGradeTextBox.text == "" {
            
        } else {
            currentGradeTextBox.text?.appendContentsOf("%")
        }
        
    }
   
    @IBAction func editingDidBeginCurrentGrade(sender: AnyObject) {
        if currentGradeTextBox.text != "" {
            let currentText = currentGradeTextBox.text
            currentGradeTextBox.text = currentText?.substringToIndex((currentText?.endIndex.predecessor())!)
        }

    }
    
    
    @IBAction func editingDidBeginPercentage(sender: AnyObject) {
        if percentage.text != "" {
            let currentText = percentage.text
            percentage.text = currentText?.substringToIndex((currentText?.endIndex.predecessor())!)
        }
    }
    
    
    @IBAction func editingDidEndPercentage(sender: AnyObject) {
        if percentage.text == "" {
            
        } else {
            percentage.text?.appendContentsOf("%")
        }
        
    }
    
    
    @IBAction func editingDidEndFinalExamTextField(sender: AnyObject) {
        if finalWeightTextBox.text == "" {
    
        } else {
             finalWeightTextBox.text?.appendContentsOf("%")
        }

    }
    
    @IBAction func editingDidBeginFinalExamTextField(sender: AnyObject) {
        if finalWeightTextBox.text != "" {
            let currentText = finalWeightTextBox.text
            finalWeightTextBox.text = currentText?.substringToIndex((currentText?.endIndex.predecessor())!)
        }
    }
    
    
    
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
    
    func checkValues(){
        checkCurrentScore()
        checkFinalExamScore()
        checkPercentageScore()
        
    }
    
    func checkCurrentScore(){
        currentScoreBoolean = false
    }
    
    func checkFinalExamScore(){
        finalExamWeightBoolean = false
    }
    
    func checkPercentageScore(){
        percentageGradeBoolean = false
    }
    
    var currentScoreBoolean : Bool = false
    var finalExamWeightBoolean : Bool = false
    var percentageGradeBoolean : Bool = false
    
    
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "CalculateFinalExam"{
            checkValues()
            if currentScoreBoolean == true && finalExamWeightBoolean == true && percentageGradeBoolean == true{
                
                return true
            } else {
                sendAlert()
                return false
            }
        }
        return true
        
    }
    
    func sendAlert(){
        let alertController = UIAlertController(title: "Error", message: "There is an error", preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "Try Again", style: .Default) { (action) in
            // ...
        }
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true) {
            
        }

        
    }
    
    func checkScore() -> Double {
        
        let currentText = currentGradeTextBox.text
        
        
        if(currentGradeTextBox.text != ""){
            
            let currrentGradeString : String = (currentText?.substringToIndex((currentText?.endIndex.predecessor())!))!
            
            let x:Bool = isNumeric(currrentGradeString)

            if (x == true){
                
                let doubleCurrentScore:Double = Double(currrentGradeString)!
            
                if(doubleCurrentScore < 0 || doubleCurrentScore > 100 )
                {
                    let alertController = UIAlertController(title: "Error - Number", message: "The number you entered needs to be between 0 and 100", preferredStyle: .Alert)
                    
                    let OKAction = UIAlertAction(title: "Try Again", style: .Default) { (action) in
                        // ...
                    }
                    alertController.addAction(OKAction)
                    
                    self.presentViewController(alertController, animated: true) {
                        
                    }

                }
                else{
                    return doubleCurrentScore
                }
            } else {
                
                let alertController = UIAlertController(title: "No Number", message: "The value you entered is not a number.", preferredStyle: .Alert)
                
                let OKAction = UIAlertAction(title: "Try Again", style: .Default) { (action) in
                    // ...
                }
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    
                }
                
            }


        } else{
            
            let alertController = UIAlertController(title: "No Number", message: "The value you entered is not a number", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "Try Again", style: .Default) { (action) in
                // ...
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                
            }
        }
        return 0.0
    }
    
    func isNumeric(a: String) -> Bool {
        return Double(a) != nil
    }
    
    
    func checkNumbers() ->(final: Double, course: Double){
        let currentFinalExam = finalWeightTextBox.text
        
        if currentFinalExam != "" {
            
        let currrentFinalString : String = (currentFinalExam?.substringToIndex((currentFinalExam?.endIndex.predecessor())!))!
        
        let x:Bool = isNumeric(currrentFinalString)
        
        if(finalWeightTextBox.text != "" && x == true){
           
            let doubleFinalExamPercentage:Double = Double(currrentFinalString)!
            
            if(doubleFinalExamPercentage < 0 || doubleFinalExamPercentage > 100 )
            {
                let alertController = UIAlertController(title: "Error - Number", message: "The number you entered needs to be between 0 and 100", preferredStyle: .Alert)
                
                let OKAction = UIAlertAction(title: "Try Again", style: .Default) { (action) in
                    // ...
                }
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    
                }
            }
            else{
                let c:Double = 100.0 - doubleFinalExamPercentage
                return (doubleFinalExamPercentage, c)
            }
            
        }
        else{
            //alert for entering informaton into the textbox
            let alertController = UIAlertController(title: "Error", message: "The value you entered is not a number.", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "Try Again", style: .Default) { (action) in
                // ...
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                
            }

        }
        } else {
            //alert for entering informaton into the textbox
            let alertController = UIAlertController(title: "No Number", message: "The value you entered is not a number.", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "Try Again", style: .Default) { (action) in
                // ...
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                
            }

        }
        
        return (0.0, 0.0)
        
    }
    
    func percentCheck() -> Double {
        
        let percent = percentage.text
        
        let x:Bool = isNumeric(percent!)
        if(percentage.text != "" && x == true){
            let currentGrade = percentage.text! as String
            let doubleCurrentScore:Double = Double(currentGrade)!
            
            if(doubleCurrentScore < 0 || doubleCurrentScore > 100 )
            {
                let alertController = UIAlertController(title: "Error - Number", message: "The number you entered needs to be between 0 and 100", preferredStyle: .Alert)
                
                let OKAction = UIAlertAction(title: "Try Again", style: .Default) { (action) in
                    // ...
                }
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    
                }

            }
            else{
                return doubleCurrentScore
            }
        }
        else{
            
            let alertController = UIAlertController(title: "No Number", message: "The value you entered is not a number.", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "Try Again", style: .Default) { (action) in
                // ...
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                
            }
        }
        return 0.0
    }
    
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        

        if segue.identifier == "calc" {
            let currentCourseScore:Double = checkScore()
            let score = checkNumbers()
            let percentNumber = percentCheck()
        
            let nextView = segue.destinationViewController as! FinalExamTableView
        
            nextView.finalExamWorth = score.final
            nextView.finalCourseWorth = score.course
            nextView.orginalScore = currentCourseScore
            nextView.addPercent = percentNumber
        }
        
        if segue.identifier == "help" || segue.identifier == "menu"{
        }
    }
}
