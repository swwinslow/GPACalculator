//
//  HelpMainMenu.swift
//  GPACalculator
//
//  Created by Seth Winslow on 7/10/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit

class HelpMainMenu: UIViewController{
    
    override func viewDidLoad() {
        navigationItem.title = "Help"
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "final") {
            
            var yourNextViewController = segue.destinationViewController as! ContentViewController
            
            yourNextViewController.typeOfHelp =  "final"
        }
        
        
        if(segue.identifier == "semester") {
            
            var yourNextViewController = segue.destinationViewController as! ContentViewController
            
            yourNextViewController.typeOfHelp =  "semester"
        }
        
        
        if(segue.identifier == "graduation") {
            
            var yourNextViewController = segue.destinationViewController as! ContentViewController
            
            yourNextViewController.typeOfHelp =  "graduation"
        }
        
        
        if(segue.identifier == "legal") {
            
            var yourNextViewController = segue.destinationViewController as! ContentViewController
            
            yourNextViewController.typeOfHelp =  "legal"
        }
        
        
    }
    
    
}
