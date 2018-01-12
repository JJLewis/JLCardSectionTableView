//
//  JLCSExpandingCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

open class JLCSExpandingCell: JLCSPrebuiltCellView {

    public var alternateHeight:CGFloat = 250
    public var shouldPushToTopOnExpand:Bool = false
    public var shouldShrinkOnSectionChange:Bool = true
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
    
    internal func shrink() {
        if isExpanded {
            toggleExpand()
        }
    }
    
    internal func setExpandingConstraints() {
        minimisedHeightConstraint.constant = requiredHeight
        expandedHeightConstraint.constant = alternateHeight - requiredHeight
        updateConstraintsIfNeeded()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setExpandingConstraints()
    }
}
