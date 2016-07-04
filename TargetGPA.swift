//
//  TargetGPA.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 1/4/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.


//todo CHECK THE NUMBERS

import UIKit
import iAd

class TargetGPA: UIViewController, ADBannerViewDelegate{
    
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
    
    
   
    func isCurrentGPACorrect() -> Bool{
        if currentGPATextField.text != "" {
            currentGPAString = currentGPATextField.text!
            return true
        } else {
            return false
        }
        
        
    }
    
    func isGoalGPACorrect() -> Bool{
        if goalGPATextField.text != "" {
            goalGPAString = goalGPATextField.text!
            return true
        } else {
            return false
        }
    }
    
    func isCurrentHoursCorrect() -> Bool{
        if currentHoursTextField.text != "" {
            currentHoursString = currentHoursTextField.text!
            return true
        } else {
            return false
        }
    }
    
    func isRemainingHoursCorrect() -> Bool{
        if remainingHoursTextField.text != "" {
            remainingHoursString = remainingHoursTextField.text!
            return true
        } else {
            return false
        }
    }
    
    @IBAction func calculateGPA(sender: AnyObject) {
        var x:String = currentHoursTextField.text!
        var currentGPA:Double = Double(x)!
        
        
        var y:String = currentHoursTextField.text!
        var currentHours:Double = Double(y)!
        
        
        var z:String = goalGPATextField.text!
        
        
        var targetGPA:Double = Double(z)!
        goal = Double(z)!
        
        var a:String = remainingHoursTextField.text!
        var hourRemaining:Double = Double(a)!
        
        var currentRawScore:Double = currentGPA * currentHours
        
        var totalHours:Double = hourRemaining + currentHours
        
        var newRawScore:Double = totalHours * targetGPA
        
        var aim:Double = newRawScore - currentRawScore
        
        finalGPA = aim / hourRemaining
        
        print(finalGPA)

    }
  
   
    
    func dismissKeyboard() {
       
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         let nextViewController = segue.destinationViewController as! GraduationGPADisplay
        nextViewController.finalGPA = self.finalGPA
        nextViewController.goal = self.goal
        nextViewController.goalGPA.text = self.goalGPATextField.text
        nextViewController.currentGPA.text = self.currentGPATextField.text
        

    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        self.view.endEditing(true)
        textField.resignFirstResponder()
        return false
        ;
    }
}
