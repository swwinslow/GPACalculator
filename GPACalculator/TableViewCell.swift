//
//  TableViewCell.swift
//  GPACalculator
//
//  Created by Seth Winslow on 12/29/15.
//  Copyright © 2015 Seth Winslow. All rights reserved.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var className: UILabel!
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
