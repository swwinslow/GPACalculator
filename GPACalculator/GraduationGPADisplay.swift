//
//  GraduationGPADisplay.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 1/4/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit
import Social
import iAd

class GraduationGPADisplay: UIViewController, ADBannerViewDelegate  {
    
    
    @IBOutlet weak var final: UILabel!
    var goal:Double = 0
    var finalGPA:Double = 0
    var p:String = ""
    
    @IBOutlet weak var adBanner: ADBannerView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.canDisplayBannerAds = true
        self.adBanner?.delegate = self
        self.adBanner?.hidden = true
        print(finalGPA)
        
   
       
        var x:String = String(finalGPA)
        p = (String(format: "%.2f", finalGPA))
        final.text = p
       // p = (String(format: "%.2f", finalGPA))
        
    }
   
    @IBAction func shareTwitter(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let twSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            var random = generateNewNumber()
            
            if(random == 5)
            {
                twSheet.setInitialText("HELP.... I need a \(p) to achieve my goal of \(goal) using my app")
            }
            if(random == 2){
                 twSheet.setInitialText("I need a tutor.... I need a \(p) to achieve my goal of \(goal) using my app")
            }
            if (random == 1){
                 twSheet.setInitialText("HELP.... I need a \(p) to achieve my goal of \(goal) using my app")
            }
            if(random == 3){
                 twSheet.setInitialText("Call a tutor.... I need a \(p) to achieve my goal of \(goal) using my app")
            }
            if (random == 4){
                 twSheet.setInitialText("I'm screwed.... I need a \(p) to achieve my goal of \(goal) using my app")
            }
            self.presentViewController(twSheet, animated: true, completion: nil)
        } else {
            print("please login on to twitter")
        }

        
    }
    
    func generateNewNumber() -> UInt32 {
        return arc4random_uniform(5) + 1
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
