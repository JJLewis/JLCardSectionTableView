//
//  JLCSPickerCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCSPickerCell: JLCSExpandingCell {

    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var button: UIButton!
    @IBOutlet public var picker: UIPickerView!
    
    @IBAction func buttonPressed(_ sender:UIButton) {
        toggleExpandCallback(self.alternateHeight)
    }
    
    public override class func instanceFromNib() -> JLCSPickerCell {
        return jlcsBundle.loadNibNamed("JLCSPickerCell", owner: nil, options: nil)!.first as! JLCSPickerCell
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.alternateHeight = 212
    }
}
