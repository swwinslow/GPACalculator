//
//  TableViewCellmy.swift
//  GPACalculator
//
//  Created by Dennis Winslow on 12/28/15.
//  Copyright © 2015 Seth Winslow. All rights reserved.
//

import UIKit

class TableViewCellmy: UITableViewCell {

    
    @IBOutlet weak var categoryName: UILabel!
    
    @IBOutlet weak var dropsNumber: UILabel!
    
    @IBOutlet weak var percentage: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
