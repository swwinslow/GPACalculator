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
            if let currentGPADouble = Double(currentGPAString) {
                if currentGPADouble >= 0 && currentGPADouble <= 5 {
                    currentGPABoolean = true
                } else {
                    currentGPABoolean = false
                }
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
            
            if let goalGPADouble = Double(goalGPAString) {
                if goalGPADouble >= 0 {
                    goalGPABolean = true
                } else {
                    goalGPABolean = false
                }
            } else {
                goalGPABolean = false
            }
        }else {
            goalGPABolean = false
        }
    }
    
    func checkCurrentHoursCorrect(){
        if currentHoursTextField.text != "" {
            self.currentHoursString = currentHoursTextField.text!
            if let currentHoursDouble = Double(currentHoursString) {
                
                if currentHoursDouble >= 0 && currentHoursDouble <= 200 {
                    currentHoursBoolean = true
                } else {
                    currentHoursBoolean = false
                }
            } else {
                currentHoursBoolean = false
            }
        } else {
            currentHoursBoolean = false
        }
    }
    
    func checkRemainingHoursCorrect(){
        if remainingHoursTextField.text != "" {
            remainingHoursString = remainingHoursTextField.text!
            
            if let remaingHoursDouble = Double(remainingHoursString) {
                
                if remaingHoursDouble >= 0  {
                    remainingHoursBoolean = true
                } else {
                    remainingHoursBoolean = false
                }
            } else {
                remainingHoursBoolean = false
            }
        } else {
            remainingHoursBoolean = false
        }
        
    }
    
    func checkValues(){
        checkRemainingHoursCorrect()
        checkCurrentHoursCorrect()
        checkGoalGPACorrect()
        checkCurrentGPACorrect()
        
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

    
   
    
    
    
    
    func sendAlert(){
    
        if currentGPABoolean == true && currentHoursBoolean == true && goalGPABolean == true && remainingHoursBoolean == true{
            // do nothing.. data fine
        } else {
            if currentGPABoolean == false && currentHoursBoolean == false && goalGPABolean == false && remainingHoursBoolean == false{
            let alert = UIAlertView(title: "Error", message: "Please fill in data to compute your graduation GPA", delegate: nil, cancelButtonTitle: "Try again")
            alert.show()
                
            } else {
                if currentGPABoolean == false || goalGPABolean == false {
                    let alert = UIAlertView(title: "Error - GPA", message: "GPAs are not in range", delegate: nil, cancelButtonTitle: "Try Again")
                    alert.show()
                } else {
                    if currentHoursBoolean == false || remainingHoursBoolean == false {
                        var alert = UIAlertView(title: "Error - Hours", message: "Hours are not in range", delegate: nil, cancelButtonTitle: "Try again")
                        alert.show()
                    }  else {
                    }
                }
            }
        }
    }
    
    
    
    
   
    var isValuesCorrect : Bool = false
    
    
    
    @IBAction func calculateGPAButton(sender: AnyObject) {
       
        checkValues()
        if remainingHoursBoolean == true && currentHoursBoolean == true && goalGPABolean == true && currentGPABoolean == true{
            
            
            
            let currentGPADouble:Double = currentGPAToDouble()
            
            
            let currentHoursDouble:Double = currentHoursToDouble()
            
            
            let goalGPADouble:Double = goalGPAToDouble()
            
            let hoursRemainingDouble:Double = remaingHoursToDouble()
            
            
           
             
            
            
            
            let hourRemaining:Double = remaingHoursToDouble()
            
            let currentRawScore:Double = currentGPADouble * currentHoursDouble
            
            let totalHours:Double = hoursRemainingDouble + currentHoursDouble
            
            let newRawScore:Double = totalHours * goalGPADouble
            
            let aim:Double = newRawScore - currentRawScore
            
            finalGPA = aim / hourRemaining
            
            self.finalGPAString = "\(finalGPA)"
            
           performSegueWithIdentifier("calculate", sender: self)

            
            
        } else {
            print ("there is an error")
            sendAlert()

        }

    }
    
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "calculate"{
            //bisValuesCorrect = checkValues()
            //checkGPAFunction()
            if isValuesCorrect == false {
                print("we have stopped it ")
                sendAlert()
                return false
            } else {
                return true
            }
            
        }
        return true
    }
    
  
   
    
    func dismissKeyboard() {
       
        view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "calculate" {
            
            let nextViewController = segue.destinationViewController as! GraduationGPADisplay
            
            nextViewController.goalGPAStringLoad = self.goalGPAString
            nextViewController.targetGPAStringLoad = self.finalGPAString
            nextViewController.currentGPAStringLoad = self.currentGPAString
            
        }

        
        

    }
   
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        self.view.endEditing(true)
        textField.resignFirstResponder()
        return false
        ;
    }
}
