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
    
    @IBOutlet internal var backButton: UIButton!
    private let sectionHeadingHeight:CGFloat = 40
    private let headingHeight:CGFloat = 50
    internal var expandedSectionHeight:CGFloat {
        get {
            return alternateHeight + headingHeight + sectionHeadingHeight
        }
        set {
            alternateHeight = newValue - (headingHeight + sectionHeadingHeight)
        }
    }
    
    @IBAction override func buttonPressed(_ sender:UIButton) {
        toggleExpand()
    }
    
    override func setExpandingConstraints() {
        minimisedHeightConstraint.constant = headingHeight
        expandedHeightConstraint.constant = alternateHeight - headingHeight
        updateConstraintsIfNeeded()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        webview.allowsBackForwardNavigationGestures = false
        button.setImage(UIImage.JLCSRowDecoratorVerticalExpand, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        shouldPushToTopOnExpand = true
        requiredHeight = 250
        expandedSectionHeight = UIScreen.main.bounds.height
    }
    
    public override class func instanceFromNib() -> JLCSWebSectionCell {
        return jlcsBundle.loadNibNamed("JLCSWebSectionCell", owner: nil, options: nil)!.first as! JLCSWebSectionCell
    }
}

public class JLCSWebSection: JLCSSection {
    
    let webcell:JLCSWebSectionCell = JLCSWebSectionCell.instanceFromNib()
    
    public convenience init(title _title:String, url:URL) {
        self.init(title: _title, expandedHeight: nil, url: url)
    }
    
    public init(title _title:String, expandedHeight:CGFloat?, url:URL) {
        webcell.backButton.removeFromSuperview()
        webcell.showWebsite(withURL: url)
        webcell.titleLabel.text = _title
        if let e = expandedHeight {
            webcell.expandedSectionHeight = e
        }
        super.init(title: _title, rows: [webcell.row])
    }
}

public class JLCSWebSubSection: JLCSSubSection {
    
    let webcell:JLCSWebSectionCell = JLCSWebSectionCell.instanceFromNib()
    
    @objc internal func backButtonPressed(_ sender: UIButton) {
        if webcell.isExpanded {
            webcell.toggleExpand()
        }
        webcell.row.showParentsectionAction()
    }
    
    public convenience init(title _title:String, url:URL) {
        self.init(title: _title, expandedHeight: nil, url: url)
    }
    
    public init(title _title:String, expandedHeight:CGFloat?, url:URL) {
        webcell.showWebsite(withURL: url)
        webcell.titleLabel.text = _title
        if let e = expandedHeight {
            webcell.expandedSectionHeight = e
        }
        super.init(title: _title, rows: [webcell.row], backButton: nil)
        backButtonRow = webcell.row
        webcell.backButton.addTarget(self, action: #selector(JLCSWebSubSection.backButtonPressed(_:)), for: .touchUpInside)
    }
}
