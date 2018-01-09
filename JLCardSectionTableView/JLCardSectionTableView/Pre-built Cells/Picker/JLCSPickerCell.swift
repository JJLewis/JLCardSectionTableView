//
//  JLCSPickerCell.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCSPickerCell: JLCSExpandingCell, UIPickerViewDataSource, UIPickerViewDelegate {

    public var selectionChangedCallback:(String)->() = {_ in }
    
    private var pickerOptions:[String] = []
    
    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var button: UIButton!
    @IBOutlet public var picker: UIPickerView!
    
    @IBAction func buttonPressed(_ sender:UIButton) {
        toggleExpand()
    }
    
    public func setPickerOptions(_ options:[String]) {
        pickerOptions = options
        if let initialTitle = pickerOptions.first {
            button.setTitle(initialTitle, for: .normal)
        }
    }
    
    public func setSelectedIndex(_ index:Int) {
        button.setTitle(pickerOptions[index], for: .normal)
    }
    
    public func setSelectedTitle(_ title:String) {
        button.setTitle(title, for: .normal)
    }
    
    // MARK: UIPickerView Data Source
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        button.setTitle(pickerOptions[row], for: .normal)
        selectionChangedCallback(pickerOptions[row])
    }
    
    public override class func instanceFromNib() -> JLCSPickerCell {
        return jlcsBundle.loadNibNamed("JLCSPickerCell", owner: nil, options: nil)!.first as! JLCSPickerCell
    }
    
    public override func awakeFromNib() {
        self.alternateHeight = 212
        super.awakeFromNib()
    }
}
