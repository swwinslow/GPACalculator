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
        
        self.navigationItem.title = "Help"
        
        //slide show
        
        self.pageTitles = NSArray(objects: "Final Exam", "Graduation GPA")
        self.pageImages = NSArray(objects: "finalexam","graduationGPA")
        
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        
        
        var startVC = self.viewControllerAtIndex(0) as! ContentViewController
        
        var viewControllers = NSArray(object: startVC)
        
        
        
        self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        
        
        self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 60)
        
        
        
        self.addChildViewController(self.pageViewController)
        
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMoveToParentViewController(self)
        
        
    }
    
    
    
    func viewControllerAtIndex(index: Int)->ContentViewController{
        if((self.pageTitles.count == 0) || index >= self.pageTitles.count){
            return ContentViewController()
        }
        var vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewCotroller") as! ContentViewController
        vc.imageFile = self.pageImages[index] as! String
        vc.titleText = self.pageTitles[index] as! String
   
        vc.pageIndex = index
        return vc
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if(index == 0 || index == NSNotFound){
            return nil
        }
        index--
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        if(index == NSNotFound){
            return nil
        }
        index++
        if(index == self.pageTitles.count){
            return nil
        }
        return self.viewControllerAtIndex(index)
    }
    
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }


}