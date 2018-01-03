//
//  JLCSSegmentedControlCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCSSegmentedControlCell: UIView {
    
    public var selectionChangedCallback:(UISegmentedControl)->() = {_ in }
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentedSelectionChanged(_ sender: UISegmentedControl) {
        selectionChangedCallback(sender)
    }
    
    public class func instanceFromNib() -> JLCSSegmentedControlCell {
        return jlcsBundle.loadNibNamed("JLCSSegmentedControlCell", owner: nil, options: nil)!.first as! JLCSSegmentedControlCell
    }
}
