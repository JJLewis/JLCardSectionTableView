//
//  JLCSWebSection.swift
//  JLCardSectionTableView
//
//  Created by jordanlewis on 9/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit
import WebKit

class JLCSWebSectionCell: JLCSWebCell {
    
    @IBAction override func buttonPressed(_ sender:UIButton) {
        toggleExpand()
    }
    
    public override func awakeFromNib() {
        let headingHeight:CGFloat = 50
        shouldPushToTopOnExpand = true
        self.requiredHeight = 250
        self.alternateHeight = UIScreen.main.bounds.height - (headingHeight + 40 /*heading size*/)
        minimisedHeightConstraint.constant = headingHeight
        expandedHeightConstraint.constant = alternateHeight - headingHeight
        updateConstraintsIfNeeded()
        webview.allowsBackForwardNavigationGestures = false
        button.setImage(UIImage.JLCSRowDecoratorVerticalExpand, for: .normal)
    }
    
    public override class func instanceFromNib() -> JLCSWebSectionCell {
        return jlcsBundle.loadNibNamed("JLCSWebSectionCell", owner: nil, options: nil)!.first as! JLCSWebSectionCell
    }
}

public class JLCSWebSection: JLCSSection {
    
    let webcell:JLCSWebSectionCell = JLCSWebSectionCell.instanceFromNib()
    
    public init(title _title:String, url:URL) {
        webcell.showWebsite(withURL: url)
        super.init(title: _title, rows: [webcell.row])
    }
}
