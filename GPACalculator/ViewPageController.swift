//
//  newViewController.swift
//  GPACalculator
//
//  Created by Seth Winslow on 12/28/15.
//  Copyright © 2015 Seth Winslow. All rights reserved.
//

import UIKit

class ViewPageController: UIViewController, UIPageViewControllerDataSource {
    
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "Final Exam Help"
        
        //slide show
        
        self.pageTitles = NSArray(objects: "Final Exam")
        self.pageImages = NSArray(objects: "finalexam")
        
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        
        
              
    }
    
    
    
   
}