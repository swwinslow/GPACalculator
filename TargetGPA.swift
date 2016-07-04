//
//  TargetGPA.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 1/4/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.


//todo CHECK THE NUMBERS

import UIKit


class TargetGPA: UIViewController{
    
    var finalGPA:Double = 0.0
    var goal:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        self.navigationItem.title = "Graduation GPA"
        
        
    }


    @IBOutlet weak var currentGPATextField: UITextField!
  
    @IBOutlet weak var currentHoursTextField: UITextField!
    
    @IBOutlet weak var goalGPATextField: UITextField!
    
    @IBOutlet weak var remainingHoursTextField: UITextField!
    
    var currentGPAString:String = ""
    var currentHoursString: String = ""
    var goalGPAString : String = ""
    var remainingHoursString :String = ""
    var finalGPAString:String = ""
    
    var currentGPABoolean:Bool = false
    var goalGPABolean: Bool = false
    var currentHoursBoolean : Bool = false
    var remainingHoursBoolean: Bool = false
    
    
   
    func checkCurrentGPACorrect(){
        if currentGPATextField.text != "" {
            self.currentGPAString = currentGPATextField.text!
            if currentGPAString >= "0" && currentGPAString < "5" {
                currentGPABoolean = true
            } else {
                currentGPABoolean = false
            }
            
        } else {
            currentGPABoolean = false
        }
    }
    
    func checkGoalGPACorrect(){
        if goalGPATextField.text != "" {
            self.goalGPAString = goalGPATextField.text!
            if goalGPAString >= "0" && goalGPAString < "5" {
                goalGPABolean = true
            } else {
                goalGPABolean = false
            }
        } else {
            goalGPABolean = false
        }
    }
    
    func checkCurrentHoursCorrect(){
        if currentHoursTextField.text != "" {
            self.currentHoursString = currentHoursTextField.text!
            if currentHoursString >= "1"{
                currentHoursBoolean = true
            } else {
                currentHoursBoolean = false
            }
        } else {
            currentHoursBoolean =  false
        }
    }
    
    func checkRemainingHoursCorrect(){
        if remainingHoursTextField.text != "" {
            remainingHoursString = remainingHoursTextField.text!
            if remainingHoursString >= "1"{
                remainingHoursBoolean = true
            } else {
                remainingHoursBoolean = false
            }
        } else {
            remainingHoursBoolean = false
        }
    }
    
    func currentGPAToDouble() -> Double{
        var currentGPAString:String = currentHoursTextField.text!
        var currentGPADouble:Double = Double(currentGPAString)!
        return currentGPADouble
    }
    
    func currentHoursToDouble() -> Double {
        var y:String = currentHoursTextField.text!
        var currentHoursDouble:Double = Double(y)!
        return currentHoursDouble
    }
    
    func goalGPAToDouble() -> Double {
        var z:String = goalGPATextField.text!
        var goalGPADouble:Double = Double(z)!
        return goalGPADouble
    }
    
    func remaingHoursToDouble() -> Double{
        var a:String = remainingHoursTextField.text!
        var hourRemaining:Double = Double(a)!
        return hourRemaining
    }
    
    
   
    @IBAction func calculateGPA(sender: AnyObject) {
        //var x:String = currentHoursTextField.text!
        var currentGPA:Double = currentGPAToDouble()
        
        
        //  var y:String = currentHoursTextField.text!
        var currentHours:Double = currentHoursToDouble()
        
        
        var z:String = goalGPATextField.text!
        
        
        var targetGPA:Double = Double(z)!
        goal = Double(z)!
        
        // var a:String = remainingHoursTextField.text!
        var hourRemaining:Double = remaingHoursToDouble()
        
        var currentRawScore:Double = currentGPA * currentHours
        
        var totalHours:Double = hourRemaining + currentHours
        
        var newRawScore:Double = totalHours * targetGPA
        
        var aim:Double = newRawScore - currentRawScore
        
        finalGPA = aim / hourRemaining
        
        finalGPAString = "\(finalGPA)"
    }
    
    func calculateGPA(){
        //var x:String = currentHoursTextField.text!
        var currentGPA:Double = currentG PAToDouble()
        
        
        //  var y:String = currentHoursTextField.text!
        var currentHours:Double = currentHoursToDouble()
        
        
        var z:String = goalGPATextField.text!
        
        
        var targetGPA:Double = Double(z)!
        goal = Double(z)!
        
        // var a:String = remainingHoursTextField.text!
        var hourRemaining:Double = remaingHoursToDouble()
        
        var currentRawScore:Double = currentGPA * currentHours
        
        var totalHours:Double = hourRemaining + currentHours
        
        var newRawScore:Double = totalHours * targetGPA
        
        var aim:Double = newRawScore - currentRawScore
        
        finalGPA = aim / hourRemaining
        
        finalGPAString = "\(finalGPA)"
    }
  
   
    
    func dismissKeyboard() {
       
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        calculateGPA()
         let nextViewController = segue.destinationViewController as! GraduationGPADisplay
        
        nextViewController.goalGPAStringLoad = self.goalGPAString
        nextViewController.targetGPAStringLoad = self.finalGPAString
        nextViewController.currentGPAStringLoad = self.currentGPAString
        

    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        self.view.endEditing(true)
        textField.resignFirstResponder()
        return false
        ;
    }
}
