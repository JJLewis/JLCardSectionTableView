//
//  JLCSPickerCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCSPickerCell: JLCSPrebuiltCellView {

    internal let expandedHeight:CGFloat = 212
    
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var button: UIButton!
    @IBOutlet public var picker: UIPickerView!
    
    internal var toExpandCallback:(CGFloat)->() = {_ in }
    
    @IBAction func buttonPressed(_ sender:UIButton) {
        toExpandCallback(expandedHeight)
    }
    
    public override class func instanceFromNib() -> JLCSPickerCell {
        return jlcsBundle.loadNibNamed("JLCSPickerCell", owner: nil, options: nil)!.first as! JLCSPickerCell
    }
}
