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
            desFinalExam.appendContentsOf("After you have calculated the score, a table appears with your scores according to that particulat data set. \r\n")
            desFinalExam.appendContentsOf("On the left, it shows what you need on the final and on the right is what you would get in your class. \r\n")
            
            desFinalExam.appendContentsOf("\r\n")
            
            desFinalExam.appendContentsOf("DISCLAIMER: \r\n")
            desFinalExam.appendContentsOf("This scoring is used on a traditional grade system. \r\n")
            desFinalExam.appendContentsOf("To best figure out your score, consult your Professor, Instrcutor, GA, TA, counselor, etc.  \r\n")
            
            
            
            descriptionTextArea.text = "\(desFinalExam)"
            descriptionTextArea.font = UIFont(name: "Avenir-Light", size: 15.0)


            
            
        }
        if typeOfHelp == "semester"{
            navigationItem.title = "Semester GPA Help"
            
            image.image = UIImage(named: "graduationGPA")
            image.layer.borderColor = UIColor.whiteColor().CGColor
            image.layer.borderWidth = 2
            
            var desFinalExam:String = "Semester GPA: \r\n"
            desFinalExam.appendContentsOf("How to Calculate your semester grade: \r\n")
            desFinalExam.appendContentsOf("1) Pick either College or High School GPA style. \r\n")
            desFinalExam.appendContentsOf("2) Press the '+' symbol to add courses. \r\n")
            desFinalExam.appendContentsOf("3) Enter the name of the course. \r\n")
            desFinalExam.appendContentsOf("4HS) All high school course are set to 1 credit hour. \r\n")
            desFinalExam.appendContentsOf("4College) Please enter the amount of credits associated with course. \r\n")
            desFinalExam.appendContentsOf("5HS) Finally, enter whether this is a regular, honors, or AP course.  \r\n")
            desFinalExam.appendContentsOf("5College: All college courses do not have a weight to their grade \r\n")
            desFinalExam.appendContentsOf("6) Press the 'Save' Button in the right hand corner to save the data. \r\n")
            desFinalExam.appendContentsOf("7) After all the courses have been entered, press 'Calculate' button. \r\n")
            desFinalExam.appendContentsOf("8) This will display the current GPA. \r\n")



            
            desFinalExam.appendContentsOf("\r\n")
            
            
            desFinalExam.appendContentsOf("What does the table show: \r\n")
            desFinalExam.appendContentsOf("After you have calculated the score, a table appears with your scores according to that particulat data set. \r\n")
            desFinalExam.appendContentsOf("On the left, it shows what you need on the final and on the right is what you would get in your class. \r\n")
            
            desFinalExam.appendContentsOf("\r\n")
            
            desFinalExam.appendContentsOf("DISCLAIMER: \r\n")
            desFinalExam.appendContentsOf("This scoring is used on a traditional grade system. \r\n")
            desFinalExam.appendContentsOf("To best figure out your score, consult your Professor, Instrcutor, GA, TA, counselor, etc.  \r\n")
            
            
            
            descriptionTextArea.text = "\(desFinalExam)"
            descriptionTextArea.font = UIFont(name: "Avenir-Light", size: 15.0)


            
           
            
        }
        if typeOfHelp == "graduation"{
            navigationItem.title = "Graduation Help"
            
            image.image = UIImage(named: "graduationGPA")
            image.layer.borderColor = UIColor.whiteColor().CGColor
            image.layer.borderWidth = 2

            
            var desSemester:String = "Graduation GPA: \r\n"
            desSemester.appendContentsOf("\r\n")

            desSemester.appendContentsOf("How to Calculate your Graduation GPA: \r\n")
            desSemester.appendContentsOf("1) Enter current GPA. \r\n")

            desSemester.appendContentsOf("In the example I have entered 2.76.\r\n")
            desSemester.appendContentsOf("\r\n")

            desSemester.appendContentsOf("2) Enter the current hours that have been completed for that GPA. \r\n")
            desSemester.appendContentsOf("In the example, I have entered 59 hours. \r\n")
            desSemester.appendContentsOf("Do NOT include hours that might have transfered that does not affect your GPA. (i.e. AP credits). \r\n")
            desSemester.appendContentsOf("\r\n")

            desSemester.appendContentsOf("3) Enter your goal GPA. This is the one that you want at the end of your time at this instution.")
            desSemester.appendContentsOf("In the example, my goal GPA is 3.0 \r\n")
            desSemester.appendContentsOf("\r\n")

            desSemester.appendContentsOf("4) Enter the amount of hours that are remaining until you are done \r\n")
            desSemester.appendContentsOf("In the example, I have 62 credit hours left to finish \r\n")
            desSemester.appendContentsOf("\r\n")

            desSemester.appendContentsOf("5) Press enter after all the information has been entered. \r\n")
            
            desSemester.appendContentsOf("\r\n")
            
            desSemester.appendContentsOf("What does that GPA mean: \r\n")
            desSemester.appendContentsOf("\r\n")

            desSemester.appendContentsOf("After all the courses have been entered, this GPA is what was calculated with the grade, credit hours, and any extra distinction. \r\n")
            desSemester.appendContentsOf("In other words, this is the current GPA for the semester. \r\n")
            
            desSemester.appendContentsOf("\r\n")
            
            desSemester.appendContentsOf("DISCLAIMER: \r\n")
            desSemester.appendContentsOf("This GPA is used on a traditional grading system. \r\n")
            desSemester.appendContentsOf("To best figure out your GPA please consult your Professors, Instrcutors, GAs, TAs, counselors, etc.  \r\n")

            descriptionTextArea.font = UIFont.systemFontOfSize(20)

            descriptionTextArea.text = "\(desSemester)"
            descriptionTextArea.font = UIFont(name: "Avenir-Light", size: 15.0)
           

        }
        if typeOfHelp == "legal"{
        
            navigationItem.title = "Legal"
            image.layer.borderColor = UIColor.whiteColor().CGColor
            image.layer.borderWidth = 2
            
            image.image = UIImage(named: "GPAHelperIcon")
            
            var desSemester:String = "Information on GPA Helper: \r\n"
            desSemester.appendContentsOf("What is GPA Helper: \r\n")
            desSemester.appendContentsOf("GPA Helper is a calculator that can calculate your final exam, graduation, and also semester GPA. \r\n")
            
            desSemester.appendContentsOf("\r\n")
            
            desSemester.appendContentsOf("High School Scale: \r\n")
            
            desSemester.appendContentsOf("A+ = 4.33 \r\n")
            desSemester.appendContentsOf("A = 4.00 \r\n")
            desSemester.appendContentsOf("A- = 3.67 \r\n")
            
            desSemester.appendContentsOf("B+ = 3.33 \r\n")
            desSemester.appendContentsOf("B = 3.00 \r\n")
            desSemester.appendContentsOf("B- = 2.67 \r\n")
            
            
            desSemester.appendContentsOf("C+ = 2.33 \r\n")
            desSemester.appendContentsOf("C = 2.00 \r\n")
            desSemester.appendContentsOf("C- = 1.67 \r\n")
            
            desSemester.appendContentsOf("D+ = 1.33 \r\n")
            desSemester.appendContentsOf("D = 1.00 \r\n")
            desSemester.appendContentsOf("D- = 0.67 \r\n")
            
            desSemester.appendContentsOf("F = 0.00 \r\n")
            
            desSemester.appendContentsOf("AP = 0.143 \r\n")
            desSemester.appendContentsOf("Honors = 0.096 \r\n")
            
            desSemester.appendContentsOf(" \r\n")

            
            
            desSemester.appendContentsOf("College Scale: \r\n")
            
            desSemester.appendContentsOf("A+ = 4.00 \r\n")
            desSemester.appendContentsOf("A = 4.00 \r\n")
            desSemester.appendContentsOf("A- = 3.67 \r\n")
            
            desSemester.appendContentsOf("B+ = 3.33 \r\n")
            desSemester.appendContentsOf("B = 3.00 \r\n")
            desSemester.appendContentsOf("B- = 2.67 \r\n")
            
            
            desSemester.appendContentsOf("C+ = 2.33 \r\n")
            desSemester.appendContentsOf("C = 2.00 \r\n")
            desSemester.appendContentsOf("C- = 1.67 \r\n")
            
            desSemester.appendContentsOf("D+ = 1.33 \r\n")
            desSemester.appendContentsOf("D = 1.00 \r\n")
            desSemester.appendContentsOf("D- = 0.67 \r\n")
            
            desSemester.appendContentsOf("F = 0.00 \r\n")
            
            desSemester.appendContentsOf(" \r\n")


            
            desSemester.appendContentsOf("DISCLAIMER: \r\n")
            desSemester.appendContentsOf("\r\n")
 
            desSemester.appendContentsOf("This GPA is used on a traditional grading system. \r\n")
            desSemester.appendContentsOf("To best figure out your GPA please consult your Professors, Instrcutors, GAs, TAs, counselors, etc.  \r\n")
            
            descriptionTextArea.text = "\(desSemester)"
            descriptionTextArea.font = descriptionTextArea.font?.fontWithSize(20)
            descriptionTextArea.font = UIFont(name: "Avenir-Light", size: 15.0)

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
