//
//  GraduationGPADisplay.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 1/4/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.

// todo hook up the gps's + the final results

//

import UIKit


class GraduationGPADisplay: UIViewController  {
    
    @IBOutlet weak var targetGPALabel: UILabel!
    @IBOutlet weak var goalGPALabel: UILabel!
    @IBOutlet weak var currentGPALabel: UILabel!
    
    var goalGPADouble:Double = 0.0
    var goalGPAStringLoad:String = "3.0"
    var currentGPADouble:Double = 0.0
    var currentGPAStringLoad:String = "2.76"
    var targerGPADouble:Double = 0.0
    var targetGPAStringLoad:String = ""
    
     override func viewDidLoad() {
        super.viewDidLoad()
       
        print(self.targetGPAStringLoad)
        print(self.currentGPAStringLoad)
        print(self.goalGPAStringLoad)
        self.navigationItem.title = "Results"
        
    
        let doublex: Double = Double(targetGPAStringLoad)!
       
        //let targetGPADouble: Double = Double(targetGPAStringLoad)!
        
        targetGPALabel.text = String(format: "%.2f", doublex)
        
       // var currentGPAString:String = (String(format: "%.2f", currentGPAStringLoad))

        currentGPALabel.text = "\(currentGPAStringLoad)"
        

        goalGPALabel.text = "\(goalGPAStringLoad)"
       
        
       
        
        
    }
   
  
}
