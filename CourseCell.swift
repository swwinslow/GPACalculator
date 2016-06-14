//
//  CourseCell.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/12/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet weak var classCourse: UILabel!
    @IBOutlet weak var classGrade: UILabel!
    @IBOutlet weak var classCredit: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
