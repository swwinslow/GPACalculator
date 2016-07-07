//
//  MainMenuViewController.swift
//  GPACalculator
//
//  Created by Seth Winslow on 7/6/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit

class MainMenuViewController : ViewController {
    
    @IBOutlet weak var help: UIButton!
    @IBOutlet weak var finalExamGrade: UIButton!
    @IBOutlet weak var semesterGrades: UIButton!
    
    @IBOutlet weak var graduationGPA: UIButton!
    
    override func viewDidLoad() {
        semesterGrades.titleLabel?.text = "Semester Grades"
        semesterGrades.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        semesterGrades.titleLabel?.numberOfLines = 2
        semesterGrades.titleLabel?.textAlignment = NSTextAlignment.Center
        semesterGrades.titleLabel?.adjustsFontSizeToFitWidth = true
        semesterGrades.titleLabel?.minimumScaleFactor = 1.5
        
        graduationGPA.titleLabel?.text = "Graduation GPA"
        graduationGPA.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        graduationGPA.titleLabel?.numberOfLines = 2
        graduationGPA.titleLabel?.textAlignment = NSTextAlignment.Center
        graduationGPA.titleLabel?.adjustsFontSizeToFitWidth = true
        
        finalExamGrade.titleLabel?.text = "Final Exam Grade"
        finalExamGrade.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        finalExamGrade.titleLabel?.numberOfLines = 3
        finalExamGrade.titleLabel?.textAlignment = NSTextAlignment.Center
        
        finalExamGrade.titleLabel?.adjustsFontSizeToFitWidth = true

        

        
        
    }
}
