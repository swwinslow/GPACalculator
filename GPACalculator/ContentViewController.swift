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

   
    @IBOutlet weak var descriptionTextArea: UITextView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if typeOfHelp == "final"{
            navigationItem.title = "Final Exam Help"
            
            image.image = UIImage(named: "finalexam")
            image.layer.borderColor = UIColor.whiteColor().CGColor
            image.layer.borderWidth = 2
            
            var desFinalExam:String = "Final Exam Score: \r\n"
            desFinalExam.appendContentsOf("How to Calculate your grade: \r\n")
            desFinalExam.appendContentsOf("1) Enter your current score of the course. \r\n")
            desFinalExam.appendContentsOf("In the example I have a 74.6% in the course.")
            desFinalExam.appendContentsOf("2) Enter the percentage of how much the final is worth. \r\n")
            desFinalExam.appendContentsOf("In the example, the final is worth 20%. \r\n")
            desFinalExam.appendContentsOf("3) Enter the percentage that is desired in the course.")
            desFinalExam.appendContentsOf("In the example, I want a 93% in the course \r\n")
            desFinalExam.appendContentsOf("4) Press calculate after information has been entered. \r\n")
            
            desFinalExam.appendContentsOf("\r\n")
            
            
            desFinalExam.appendContentsOf("What does the table show: \r\n")
            desFinalExam.appendContentsOf("After you hav calculated the score, a table appears with your scores according to that particulat data set. \r\n")
            desFinalExam.appendContentsOf("On the left, it shows what you need on the final and on the right is what you would get in your class. \r\n")
            
            desFinalExam.appendContentsOf("DISCLAIMER: \r\n")
            desFinalExam.appendContentsOf("This scoring is used on a traditional grade system. \r\n")
            desFinalExam.appendContentsOf("To best figure out your score, consult your Professor, Instrcutor, GA, TA, counselor, etc.  \r\n")
            
          
            
            
            
            
            
            
            
            
            
            descriptionTextArea.text = "\(desFinalExam)"
            
            
        } else if typeOfHelp == "semester"{
            navigationItem.title = "Semester GPA Help"
            
            image.image = UIImage(named: "graduationGPA")
            
            
        } else if typeOfHelp == "graduation"{
            navigationItem.title = "Graduation Help"
            
            image.image = UIImage(named: "graduationGPA")
            
           

        } else if typeOfHelp == "legal"{
        
            navigationItem.title = "Legal"
            
            image.image = UIImage(named: "GPAHelperIcon")
            
           
        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
