//
//  JLCSTextfieldCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCSTextfieldCell: JLCSPrebuiltCellView {

    @IBOutlet public var textfield: UITextField!
    
    public override class func instanceFromNib() -> JLCSTextfieldCell {
        return jlcsBundle.loadNibNamed("JLCSTextfieldCell", owner: nil, options: nil)!.first as! JLCSTextfieldCell
    }
}
