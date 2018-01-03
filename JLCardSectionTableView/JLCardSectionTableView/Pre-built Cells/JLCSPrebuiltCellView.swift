//
//  JLCSPrebuiltCellView.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//

import UIKit

public class JLCSPrebuiltCellView: UIView {
    
    let requiredHeight:CGFloat = 50
    
    public func makeRowFromSelf() -> JLCSRow {
        let row = JLCSRow(view: self)
        row.height = requiredHeight
        return row
    }
    
    public class func instanceFromNib() -> JLCSPrebuiltCellView {
        return JLCSPrebuiltCellView()
    }
}
