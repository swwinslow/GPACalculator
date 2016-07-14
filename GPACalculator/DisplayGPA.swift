//
//  DisplayGPA.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 1/3/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit
import GoogleMobileAds


class DisplayGPA: UIViewController, GADBannerViewDelegate{
    
    var totalRawScore:Double = 0
    var totalCredits:Double = 0
    var totalExtra:Double = 0
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var GPARaw: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var banner: GADBannerView!
    
    var education: String = ""
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creditLabel.text = ""
        GPARaw.text = ""
        display.text = ""
        
     
        
        let newRaw:Double = Double(totalRawScore)
        let newCred:Double = Double(totalCredits)
        
        var newCreditsString:String = String(format:"%.2f", newCred)
        var newRawScoreString:String = String(format:"%.2f", newRaw)
        
        var total:Double = 0
        
        if newRaw == 0.0 && newCred == 0.0{
        } else {
            total = Double(newRaw/newCred) + totalExtra
        }
        
        
        var c:String = String(format:"%.3f", total)
        print("total: \(c)") // c: 1.5
        
        
        if education == "HS GPA"{
            creditLabel.text = String("\(newCreditsString)")

        } else {
            creditLabel.text = String("\(newCreditsString)")

        }
        GPARaw.text = String("\(newRawScoreString)")
        
        
        display.text = String(c)
        
        totalCredits = 0
        totalRawScore = 0
        total = 0
        
        self.navigationItem.title = "Semester GPA"
        
        
        //Google Ads
        
        
        
        banner.hidden = true
        banner.delegate = self
        banner.adUnitID = "ca-app-pub-5747194588356444/6308365016"
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
