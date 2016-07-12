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

   
    @IBOutlet weak var textArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if typeOfHelp == "final"{
            navigationItem.title = "Final Exam Help"
            
            image.image = UIImage(named: "graduationGPA")
            
            textArea.text = "How To Compute Final Exam: \r\n"
            textArea.text.appendContentsOf("This is the second line \r\n")
            
        } else if typeOfHelp == "semester"{
            navigationItem.title = "Semester GPA Help"
            
            image.image = UIImage(named: "graduationGPA")
            
            textArea.text = "How To Compute Semester GPA "
            
        } else if typeOfHelp == "graduation"{
            navigationItem.title = "Graduation Help"
            
            image.image = UIImage(named: "graduationGPA")
            
            textArea.text = "How To Graduation Final Exam:"

        } else if typeOfHelp == "legal"{
        
            navigationItem.title = "Legal"
            
            image.image = UIImage(named: "GPAHelperIcon")
            
            textArea.text = "Legal Information"
        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
