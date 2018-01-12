//
//  JLCSPrebuiltCellView.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//

import UIKit

open class JLCSPrebuiltCellView: UIView {
    
    open var requiredHeight:CGFloat = 50
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
    
    open class func instanceFromNib() -> JLCSPrebuiltCellView {
        return JLCSPrebuiltCellView()
    }
}
