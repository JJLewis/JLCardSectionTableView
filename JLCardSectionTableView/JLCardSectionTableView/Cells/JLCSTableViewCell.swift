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
    var tapAction:()->() = {}
    
    @objc func cellTapped(_ sender:UITapGestureRecognizer) {
        tapAction()
    }
    
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
        cardContentView.isUserInteractionEnabled = true
        
        let tapGestureRecogniser:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(JLCSTableViewCell.cellTapped(_:)))
        cardContentView.addGestureRecognizer(tapGestureRecogniser)
        tapGestureRecogniser.numberOfTapsRequired = 1
        tapGestureRecogniser.numberOfTouchesRequired = 1
        tapGestureRecogniser.delegate = self
    }
}
