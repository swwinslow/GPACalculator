//
//  ViewController.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 12/28/15.
//  Copyright © 2015 Seth Winslow. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {
    
    @IBOutlet weak var adBanner: ADBannerView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.canDisplayBannerAds = true
        self.adBanner?.delegate = self
        self.adBanner?.hidden = true
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

