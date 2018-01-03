//
//  JLCSSliderCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCSSliderCell: JLCSPrebuiltCellView {

    public var sliderUpdatedCallback:(UISlider)->() = {_ in }
    
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var slider: UISlider!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderUpdatedCallback(sender)
    }
    
    public override class func instanceFromNib() -> JLCSSliderCell {
        return jlcsBundle.loadNibNamed("JLCSSliderCell", owner: nil, options: nil)!.first as! JLCSSliderCell
    }
}
