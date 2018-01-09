//
//  JLCSExpandingCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCSExpandingCell: JLCSPrebuiltCellView {

    public var alternateHeight:CGFloat = 250
    internal var toggleExpandCallback:(CGFloat)->() = {_ in }
    internal var isExpanded:Bool = false
    
    @IBOutlet var minimisedView:UIView!
    @IBOutlet var expandedView:UIView!
    @IBOutlet var minimisedHeightConstraint:NSLayoutConstraint!
    @IBOutlet var expandedHeightConstraint:NSLayoutConstraint!
    
    internal func toggleExpand() {
        toggleExpandCallback(alternateHeight)
        isExpanded = !isExpanded
    }
    
    public override func awakeFromNib() {
        minimisedHeightConstraint.constant = requiredHeight
        expandedHeightConstraint.constant = alternateHeight - requiredHeight
        updateConstraintsIfNeeded()
    }
}
