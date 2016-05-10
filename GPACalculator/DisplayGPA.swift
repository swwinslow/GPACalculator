//
//  DisplayGPA.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 1/3/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit
import iAd

class DisplayGPA: UIViewController, ADBannerViewDelegate{
    
    var totalRawScore:Double = 0
    var totalCredits:Double = 0
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var GPARaw: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    
    @IBOutlet weak var adBanner: ADBannerView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creditLabel.text = ""
        GPARaw.text = ""
        display.text = ""
        
        
        self.canDisplayBannerAds = true
        self.adBanner?.delegate = self
        
        self.adBanner?.hidden = true
        
        let newRaw:Double = Double(totalRawScore)
        let newCred:Double = Double(totalCredits)
        
        var a:String = String(format:"%.2f", newCred)
        var b:String = String(format:"%.2f", newRaw)
        var total:Double = Double(newRaw / newCred)
        
        var c:String = String(format:"%.3f", total)
        print("total: \(c)") // c: 1.5
        
        
        
        creditLabel.text = String("Total Credit Hours: \(a)")
        GPARaw.text = String("Total Raw Score \(b)")
        display.text = String(c)
        
        totalCredits = 0
        totalRawScore = 0
        total = 0
        
        self.navigationItem.title = "Semester GPA"
        
       

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

    
    @IBAction func newCourse(sender: AnyObject) {
        
    }
    
    
}
