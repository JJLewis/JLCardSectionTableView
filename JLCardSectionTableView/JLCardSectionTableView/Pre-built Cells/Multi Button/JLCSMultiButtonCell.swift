//
//  JLCSMultiButtonCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 5/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCSMultiButtonCell: JLCSPrebuiltCellView {
    
    public var buttonPressedCallback:(UIButton, Int)->() = {_,_ in }
    
    @IBOutlet var horizontalStackview: UIStackView!
    
    public func addButtonWithTitle(_ title:String) {
        let button = UIButton(type: .roundedRect)
        button.setTitle(title, for: .normal)
        addButton(button)
    }
    
    public func addButton(_ button:UIButton) {
        button.addTarget(self, action: #selector(JLCSMultiButtonCell.buttonPressed(_:)), for: .touchUpInside)
        horizontalStackview.addArrangedSubview(button)
    }
    
    @objc func buttonPressed(_ sender:UIButton) {
        for i in 0..<horizontalStackview.arrangedSubviews.count {
            if sender == horizontalStackview.arrangedSubviews[i] {
                buttonPressedCallback(sender, i)
                break
            }
        }
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
