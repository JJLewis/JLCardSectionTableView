//
//  JLCSTableViewCell.swift
//  JLCardSectionTableView
//
//  Created by jordanlewis on 26/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import UIKit

class JLCSTableViewCell: UITableViewCell {
    
    @IBOutlet var shadowView: JLRoundedShadowView!
    @IBOutlet var cardContentView:UIView!
    
    func setContent(view:UIView) {
        cardContentView.addSubview(view)
        cardContentView.fitToSuperView(view: view)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        clipsToBounds = true
        contentView.clipsToBounds = true
        
        cardContentView.layer.cornerRadius = 10
        cardContentView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
