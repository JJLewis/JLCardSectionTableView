//
//  JLCSSwitchCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCSSwitchCell: JLCSPrebuiltCellView {
    
    public var switchToggledCallback:(UISwitch)->() = {_ in }
    
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var toggle: UISwitch!
    
    @IBAction func switchToggled(_ sender:UISwitch) {
        switchToggledCallback(sender)
    }
    
    public override class func instanceFromNib() -> JLCSSwitchCell {
        return jlcsBundle.loadNibNamed("JLCSSwitchCell", owner: nil, options: nil)!.first as! JLCSSwitchCell
    }
}
