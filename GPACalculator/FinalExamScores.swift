//
//  FinalExamScores.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 3/7/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit

class FinalExamScores: UIViewController{
    
    var s100:String = ""
    var s95:String = ""
    var s90:String = ""
    var s85:String = ""
    var s80:String = ""
    var s75:String = ""
    var s70:String = ""
    var s65:String = ""
    var s60:String = ""

    @IBOutlet weak var currentGradeLabel: UILabel!
    @IBOutlet weak var finalExamLabel: UILabel!
    
    @IBOutlet weak var Score100Label: UILabel!
    @IBOutlet weak var Score95Label: UILabel!
    @IBOutlet weak var Score90Label: UILabel!
    @IBOutlet weak var Score85Label: UILabel!
    @IBOutlet weak var Score80Label: UILabel!
    @IBOutlet weak var Score75Label: UILabel!
    @IBOutlet weak var Score70Label: UILabel!
    @IBOutlet weak var Score65Label: UILabel!
    @IBOutlet weak var Score60Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Score100Label.text = s100
        Score95Label.text = s95
        Score90Label.text = s90
        Score85Label.text = s85
        Score80Label.text = s80
        Score75Label.text = s75
        Score70Label.text = s70
        Score65Label.text = s65
        Score60Label.text = s60
        
    }
    
    
    
    
    
}
