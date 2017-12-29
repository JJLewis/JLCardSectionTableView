//
//  CustomCellView.swift
//  JLCardSectionTableViewDemo
//
//  Created by Jordan Lewis on 29/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import UIKit

class CustomCellView: UIView {
    
    @IBOutlet var titleLabel:UILabel!
    
    @IBAction func toggled(_ sender:UISwitch) {
        titleLabel.text = "Switch is \(sender.isOn ? "On":"Off")"
    }
}
