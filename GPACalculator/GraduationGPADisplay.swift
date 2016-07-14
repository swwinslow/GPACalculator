//
//  GraduationGPADisplay.swift
//  GPACalculator
//
//  Created by Seth Winslow on 1/4/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.

// todo hook up the gps's + the final results

//

import UIKit
import GoogleMobileAds


class GraduationGPADisplay: UIViewController, GADBannerViewDelegate  {
    
    @IBOutlet weak var targetGPALabel: UILabel!
    @IBOutlet weak var goalGPALabel: UILabel!
    @IBOutlet weak var currentGPALabel: UILabel!
    @IBOutlet weak var banner: GADBannerView!
    
    var goalGPADouble:Double = 0.0
    var goalGPAStringLoad:String = "3.0"
    var currentGPADouble:Double = 0.0
    var currentGPAStringLoad:String = "2.76"
    var targerGPADouble:Double = 0.0
    var targetGPAStringLoad:String = ""
    
     override func viewDidLoad() {
        super.viewDidLoad()
       
        // SET THE TITLE OF THE VIEW
        self.navigationItem.title = "Results"
        
    
        let targetDouble: Double = Double(targetGPAStringLoad)!
        let currentDobule: Double = Double(currentGPAStringLoad)!
        let goalDouble: Double = Double(goalGPAStringLoad)!
        
       

        
        
       // var currentGPAString:String = (String(format: "%.2f", currentGPAStringLoad))

        currentGPALabel.text = "\(currentGPAStringLoad)"
        

        goalGPALabel.text = "\(goalGPAStringLoad)"
       
        
        //Google Ads
        
        banner.hidden = true
        banner.delegate = self
        banner.adUnitID = "ca-app-pub-5747194588356444/4251379011"
        banner.rootViewController = self
        banner.loadRequest(GADRequest())
        
        
    }
    func adViewDidReceiveAd(bannerView: GADBannerView!) {
        banner.hidden = false
    }
    
    func adView(bannerView: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        banner.hidden = true
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "menu" || segue.identifier == "help"{
        }
        
    }
   
  
}
