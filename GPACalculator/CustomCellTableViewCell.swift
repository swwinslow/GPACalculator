//
//  CustomCellTableViewCell.swift
//  GPACalculator
//
//  Created by Seth Winslow on 6/12/16.
//  Copyright © 2016 Seth Winslow. All rights reserved.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var classCredit: UILabel!
    @IBOutlet weak var classGrade: UILabel!
    @IBOutlet weak var className: UILabel!
}
