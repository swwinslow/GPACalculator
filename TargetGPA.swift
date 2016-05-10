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
        self.canDisplayBannerAds = true
        self.adBanner?.delegate = self
        self.adBanner?.hidden = true
        
    }

    @IBOutlet weak var adBanner: ADBannerView?
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
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        
        self.adBanner?.hidden = false
        
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        
        self.adBanner?.hidden = true
        
    }
    
}
