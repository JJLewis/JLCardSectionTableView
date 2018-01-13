//
//  JLCSLabelCell.swift
//  JLCardSectionTableView
//
//  Created by jordanlewis on 13/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCSLabelCell: JLCSPrebuiltCellView {

    @IBOutlet public var titleLabel: UILabel!
    
    public override class func instanceFromNib() -> JLCSLabelCell {
        return jlcsBundle.loadNibNamed("JLCSLabelCell", owner: nil, options: nil)!.first as! JLCSLabelCell
    }
}
