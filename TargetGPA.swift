//
//  TargetGPA.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 1/4/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit
import iAd

class TargetGPA: UIViewController, ADBannerViewDelegate{
    
    var finalGPA:Double = 0.0
    var goal:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }


    @IBOutlet weak var cummaliveGPA: UITextField!
  
    @IBOutlet weak var hoursCompleted: UITextField!
    
    @IBOutlet weak var goalGPA: UITextField!
    
    @IBOutlet weak var hoursRemaining: UITextField!
   
    
    @IBAction func calculateGPA(sender: UIButton) {
        
        var x:String = cummaliveGPA.text!
        var currentGPA:Double = Double(x)!
        
        
        var y:String = hoursCompleted.text!
        var currentHours:Double = Double(y)!
        
        
        var z:String = goalGPA.text!
        
        
        var targetGPA:Double = Double(z)!
        goal = Double(z)!
        
        var a:String = hoursRemaining.text!
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
         let svc = segue.destinationViewController as! GraduationGPADisplay
        svc.finalGPA = self.finalGPA
        svc.goal = self.goal

    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        self.view.endEditing(true)
        textField.resignFirstResponder()
        return false
        ;
    }
}
