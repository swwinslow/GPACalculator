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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        self.navigationItem.title = "Graduation GPA"
        
        currentGPATextField.text = "2.76"
        currentHoursTextField.text = "59"
        goalGPATextField.text = "3.0"
        remainingHoursTextField.text = "61"
        
        
    }


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
        let currentGPAString:String = currentGPATextField.text!
        let currentGPADouble:Double = Double(currentGPAString)!
        return currentGPADouble
    }
    
    func currentHoursToDouble() -> Double {
        let y:String = currentHoursTextField.text!
        let currentHoursDouble:Double = Double(y)!
        return currentHoursDouble
    }
    
    func goalGPAToDouble() -> Double {
        let z:String = goalGPATextField.text!
        let goalGPADouble:Double = Double(z)!
        return goalGPADouble
    }
    
    func remaingHoursToDouble() -> Double{
        let a:String = remainingHoursTextField.text!
        let hourRemaining:Double = Double(a)!
        return hourRemaining
    }
    
    func checkValues() -> Bool {
        checkGoalGPACorrect()
        checkCurrentGPACorrect()
        checkRemainingHoursCorrect()
        checkCurrentHoursCorrect()
        
        if currentGPABoolean == true && currentHoursBoolean == true && goalGPABolean == true && remainingHoursBoolean == true{
            return true
        } else {
            return false
        }
    }
    
    
   
    
    
    func calculateGPA(){
        
        let isValuesCorrect : Bool = checkValues()
        
        if isValuesCorrect == true {
            
        
        
        let currentGPA:Double = currentGPAToDouble()
        
        
        //  var y:String = currentHoursTextField.text!
        let currentHours:Double = currentHoursToDouble()
        
        
        let z:String = goalGPATextField.text!
        
        
        let targetGPA:Double = Double(z)!
        goal = Double(z)!
        
        // var a:String = remainingHoursTextField.text!
        let hourRemaining:Double = remaingHoursToDouble()
        
        let currentRawScore:Double = currentGPA * currentHours
        
        let totalHours:Double = hourRemaining + currentHours
        
        let newRawScore:Double = totalHours * targetGPA
        
        let aim:Double = newRawScore - currentRawScore
        
        finalGPA = aim / hourRemaining
        
        finalGPAString = "\(finalGPA)"
        } else {
             print ("there is an error")
        }
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
