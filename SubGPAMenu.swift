//
//  SubGPAMenu.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 3/10/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit

class SubGPAMenu: UIViewController{
    override func viewDidLoad() {
        self.navigationItem.title = "GPA's"
       
    }
    
    var x = String()
    
    @IBAction func college(sender: AnyObject) {
        
        x = "college"
    }
   
    @IBAction func highschool(sender: AnyObject) {
        x = "High School"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
       
        
        if let vc = segue.destinationViewController as? GPAAdditionCourseHS {
            vc.type = x
        }
    }
}
