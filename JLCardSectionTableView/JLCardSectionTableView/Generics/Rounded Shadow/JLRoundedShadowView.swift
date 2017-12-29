//
//  JLRoundedShadowView.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 25/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import UIKit

class JLRoundedShadowView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let shadowView = Bundle.allFrameworks.filter{$0.bundleIdentifier == "com.jjlewis.JLCardSectionTableView"}.first!.loadNibNamed("JLRoundedShadowView", owner: self, options: nil)!.first as! UIView
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        shadowView.layer.shadowRadius = 4
        shadowView.layer.shadowOpacity = 0.25
        let roundedView = shadowView.subviews.first!
        roundedView.layer.cornerRadius = 10
        roundedView.clipsToBounds = true
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
