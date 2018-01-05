//
//  JLCSSegmentedControlCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCSSegmentedControlCell: JLCSPrebuiltCellView {
    
    public var selectionChangedCallback:(UISegmentedControl)->() = {_ in }
    
    @IBOutlet public var segmentedControl: UISegmentedControl!
    
    public func setSegments(_ options:[String]) {
        segmentedControl.removeAllSegments()
        for i in 0..<options.count {
            segmentedControl.insertSegment(withTitle: options[i], at: i, animated: true)
        }
    }
    
    @IBAction func segmentedSelectionChanged(_ sender: UISegmentedControl) {
        selectionChangedCallback(sender)
    }
    
    public override class func instanceFromNib() -> JLCSSegmentedControlCell {
        return jlcsBundle.loadNibNamed("JLCSSegmentedControlCell", owner: nil, options: nil)!.first as! JLCSSegmentedControlCell
    }
}
