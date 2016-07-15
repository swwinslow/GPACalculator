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
            desFinalExam.appendContentsOf("How to Calculate your grade with a final exam: \r\n")
            desFinalExam.appendContentsOf("1) Enter your current score of the course. \r\n")
            desFinalExam.appendContentsOf("In the example I have a 74.6% in the course.")
            desFinalExam.appendContentsOf("2) Enter the percentage of how much the final is worth. \r\n")
            desFinalExam.appendContentsOf("In the example, the final is worth 20%. \r\n")
            desFinalExam.appendContentsOf("3) Enter the percentage that is desired in the course.")
            desFinalExam.appendContentsOf("In the example, I want a 93% in the course \r\n")
            desFinalExam.appendContentsOf("4) Press calculate after all the information has been entered. \r\n")
            
            desFinalExam.appendContentsOf("\r\n")
            
            
            desFinalExam.appendContentsOf("What does the table show: \r\n")
            desFinalExam.appendContentsOf("After you hav calculated the score, a table appears with your scores according to that particulat data set. \r\n")
            desFinalExam.appendContentsOf("On the left, it shows what you need on the final and on the right is what you would get in your class. \r\n")
            
            desFinalExam.appendContentsOf("\r\n")
            
            desFinalExam.appendContentsOf("DISCLAIMER: \r\n")
            desFinalExam.appendContentsOf("This scoring is used on a traditional grade system. \r\n")
            desFinalExam.appendContentsOf("To best figure out your score, consult your Professor, Instrcutor, GA, TA, counselor, etc.  \r\n")
            
            
            
            descriptionTextArea.text = "\(desFinalExam)"

            
            
        }
        if typeOfHelp == "semester"{
            navigationItem.title = "Semester GPA Help"
            
            image.image = UIImage(named: "graduationGPA")
            image.layer.borderColor = UIColor.whiteColor().CGColor
            image.layer.borderWidth = 2
            
           
            
        }
        if typeOfHelp == "graduation"{
            navigationItem.title = "Graduation Help"
            
            image.image = UIImage(named: "graduationGPA")
            image.layer.borderColor = UIColor.whiteColor().CGColor
            image.layer.borderWidth = 2
            
            var graduationFinalExam:String = "Graduation GPA: \r\n"
            graduationFinalExam.appendContentsOf("How to Calculate your Graduation GPA: \r\n")
            graduationFinalExam.appendContentsOf("1) Enter current GPA. \r\n")
            graduationFinalExam.appendContentsOf("In the example I have entered 2.76.")
            graduationFinalExam.appendContentsOf("2) Enter the current hours that have been completed for that GPA. \r\n")
            graduationFinalExam.appendContentsOf("In the example, I have entered 59 hours. \r\n")
            graduationFinalExam.appendContentsOf("Do NOT include hours that might have transfered that does not affect your GPA. (i.e. AP credits). \r\n")
            graduationFinalExam.appendContentsOf("3) Enter your goal GPA. This is the one that you want at the end of your time at this instution.")
            graduationFinalExam.appendContentsOf("In the example, my goal GPA is 3.0 \r\n")
            graduationFinalExam.appendContentsOf("4) Enter the amount of hours that are remaining until you are done \r\n")
            graduationFinalExam.appendContentsOf("In the example, I have 62 credit hours left to finish \r\n")
            graduationFinalExam.appendContentsOf("5) Press enter after all the information has been entered. \r\n")
            
            graduationFinalExam.appendContentsOf("\r\n")
            
            graduationFinalExam.appendContentsOf("What does that GPA mean: \r\n")
            graduationFinalExam.appendContentsOf("After you hav calculated the score, the GPA that is listed is the average GPA that you need to achieve that goal you set. \r\n")
            graduationFinalExam.appendContentsOf("In other words, that is the GPA that you need to average for the rest of the hours you have \r\n")
            
            graduationFinalExam.appendContentsOf("\r\n")
            
            graduationFinalExam.appendContentsOf("DISCLAIMER: \r\n")
            graduationFinalExam.appendContentsOf("This GPA is used on a traditional grading system. \r\n")
            graduationFinalExam.appendContentsOf("To best figure out your GPA please consult your Professors, Instrcutors, GAs, TAs, counselors, etc.  \r\n")

            descriptionTextArea.text = "\(graduationFinalExam)"

           

        }
        if typeOfHelp == "legal"{
        
            navigationItem.title = "Legal"
            image.layer.borderColor = UIColor.whiteColor().CGColor
            image.layer.borderWidth = 2
            
            image.image = UIImage(named: "GPAHelperIcon")
            
           
        }

        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        descriptionTextArea.scrollRangeToVisible(NSRange(location:0, length:0))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
