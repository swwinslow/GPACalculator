//
//  sub2.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/10/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit

class sub2: UIViewController{
    override func viewDidLoad() {
        self.navigationItem.title = "GPA's"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.tabBarController?.navigationItem.title = "Profile Settings"
        
    }
    
    var x = String()
    
    @IBAction func college(sender: AnyObject) {
        
        x = "College GPA"
    }
    
    @IBAction func highschool(sender: AnyObject) {
        x = "HS GPA"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        if let vc = segue.destinationViewController as? CourseTableViewController {
            vc.education = x
        }
    }
}
