//
//  JLCSPrebuiltCellView.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//

import UIKit

open class JLCSPrebuiltCellView: UIView {
    
    var requiredHeight:CGFloat = 50
    private var _row:JLCSRow?
    public var row:JLCSRow {
        get {
            if let r = _row {
                return r
            } else {
                _row = JLCSRow(view: self)
                _row!.height = requiredHeight
                return _row!
            }
        }
    }
    
    public class func instanceFromNib() -> JLCSPrebuiltCellView {
        return JLCSPrebuiltCellView()
    }
}
