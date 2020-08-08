//
//  StudentCell.swift
//  FurkanIbili_HW3
//
//  Created by Mac on 25.05.2020.
//  Copyright © 2020 Furkan İbili. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    
    @IBOutlet var nameSurnameLabel: UILabel!
    @IBOutlet var gradesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Set dinamic width for labels
        nameSurnameLabel.adjustsFontSizeToFitWidth = true
        gradesLabel.adjustsFontSizeToFitWidth = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
