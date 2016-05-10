//
//  CourseHelpScreen.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 12/29/15.
//  Copyright © 2015 Seth Winslow. All rights reserved.
//

import UIKit

class CourseHelpScreen: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Course Help "
        
        
        var tapGester = UISwipeGestureRecognizer(target: self, action: "handleTapGester:")
        view.addGestureRecognizer(tapGester)
    }
    
    func handleTapGester(tapGesture: UISwipeGestureRecognizer){
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func transition() {
        let secondViewController:CourseHelpScreen = CourseHelpScreen()
        
        self.presentViewController(secondViewController, animated: true, completion: nil)
        
    }
    
    
}