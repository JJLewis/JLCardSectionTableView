//
//  JLCSMultiButtonCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 5/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCSMultiButtonCell: JLCSPrebuiltCellView {
    
    public typealias ButtonCallback = (UIButton)->()
    private var buttonsToActions:[UIButton:ButtonCallback] = [:]
    
    @IBOutlet var horizontalStackview: UIStackView!
    
    public func addButtonWithTitle(_ title:String, callback: @escaping ButtonCallback) {
        let button = UIButton(type: .roundedRect)
        button.setTitle(title, for: .normal)
        addButton(button, callback: callback)
    }
    
    public func addButton(_ button:UIButton, callback: @escaping ButtonCallback) {
        button.addTarget(self, action: #selector(JLCSMultiButtonCell.buttonPressed(_:)), for: .touchUpInside)
        horizontalStackview.addArrangedSubview(button)
        buttonsToActions[button] = callback
    }
    
    @objc func buttonPressed(_ sender:UIButton) {
        buttonsToActions[sender]!(sender)
    }
    
    public override class func instanceFromNib() -> JLCSMultiButtonCell {
        return jlcsBundle.loadNibNamed("JLCSMultiButtonCell", owner: nil, options: nil)!.first as! JLCSMultiButtonCell
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        // Just clear the nib
        for subview in horizontalStackview.arrangedSubviews {
            horizontalStackview.removeArrangedSubview(subview)
        }
    }
}
