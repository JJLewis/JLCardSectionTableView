//
//  JLCSSingleRowSectionTableViewCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 29/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import UIKit

class JLCSSingleRowSectionTableViewCell: JLCSTopTableViewCell {
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardContentView.layer.cornerRadius = 10
        cardContentView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
