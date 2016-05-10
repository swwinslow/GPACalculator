//
//  TableViewCell.swift
//  GPACalculator
//
//  Created by Seth Winslow on 12/29/15.
//  Copyright © 2015 Seth Winslow. All rights reserved.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
