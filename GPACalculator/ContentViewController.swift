//
//  ContentViewController.swift
//  GPACalculator
//
//  Created by Seth Winslow on 4/3/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var titleText: String!
    
    var typeOfHelp: String = ""

    @IBOutlet weak var scrollView: UIScrollView!
   
    @IBOutlet weak var textLabel: UILabel!
    
    var a = "This is the first step \n"
    let d = "d"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if typeOfHelp == "final"{
            navigationItem.title = "Final Exam Help"
            
            image.image = UIImage(named: "finalexam")
            image.layer.borderColor = UIColor.whiteColor().CGColor
            image.layer.borderWidth = 2
            
            a += "asdas"
            
            textLabel.numberOfLines = 100
            textLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping

    
                
                
                
            textLabel.text?.appendContentsOf("How do you computer your Final Exam: ")
       

            textLabel.text?.appendContentsOf("a\r\n")
            textLabel.text?.appendContentsOf("1. Enter your current grade in the particular class as a percentage. In the example, I currently have a 74.6 going into the final exam. \r\n")
            textLabel.text?.appendContentsOf("2. Enter how much the final is worth. For example: My final is worth 15% of my grade. \r\n")
            textLabel.text?.appendContentsOf("3. Enter a grade that you would like to receive in a percentage. For example: If I wanted a B- and a B- is worth 82%, then I would enter 82%. \r\n")
            scrollView.contentSize.height = 100
            
        } else if typeOfHelp == "semester"{
            navigationItem.title = "Semester GPA Help"
            
            image.image = UIImage(named: "graduationGPA")
            
            textLabel.text = "How To Compute Semester: \r\n"
            textLabel.text?.appendContentsOf("")

            
        } else if typeOfHelp == "graduation"{
            navigationItem.title = "Graduation Help"
            
            image.image = UIImage(named: "graduationGPA")
            
            textLabel.text = "How To Compute Graduation: \r\n"
            textLabel.text?.appendContentsOf("")


        } else if typeOfHelp == "legal"{
        
            navigationItem.title = "Legal"
            
            image.image = UIImage(named: "GPAHelperIcon")
            
            textLabel.text = "Legal Information: \r\n"
            textLabel.text?.appendContentsOf("")

        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
