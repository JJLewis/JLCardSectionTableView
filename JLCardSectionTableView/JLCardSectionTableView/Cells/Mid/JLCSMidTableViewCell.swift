//
//  JLCSMidTableViewCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 25/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import UIKit

class JLCSMidTableViewCell: JLCSTableViewCell {

    @IBOutlet var cardContentView:UIView!
    @IBOutlet var rowSeparator:UIView!
    
    func setContent(view:UIView) {
        cardContentView.addSubview(view)
        cardContentView.fitToSuperView(view: view)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
