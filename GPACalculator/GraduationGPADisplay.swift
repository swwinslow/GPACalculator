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
    var targetGPAStringLoad:String = "3.5"
    
     override func viewDidLoad() {
        super.viewDidLoad()
       
       // print(finalGPA)
        
        self.navigationItem.title = "Graduation GPA"
        
        
        var targetGPAString:String = (String(format: "%.2f", targetGPAStringLoad))
        targetGPALabel.text = "\(targetGPAString)"
        
        var currentGPAString:String = (String(format: "%.2f", currentGPAStringLoad))

        currentGPALabel.text = "\(currentGPAString)"
        
        var goalGPAString:String = (String(format: "%.2f", goalGPAStringLoad))

        goalGPALabel.text = "\(goalGPAString)"
       
        
       
        
        
    }
   
  
}
