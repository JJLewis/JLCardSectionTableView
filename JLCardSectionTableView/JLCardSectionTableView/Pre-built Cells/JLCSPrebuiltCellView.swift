//
//  JLCSPrebuiltCellView.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 3/1/18.
//

import UIKit

public class JLCSPrebuiltCellView: UIView {
    
    let height:CGFloat = 50
    
    public func makeRowFromSelf() -> JLCSRow {
        let row = JLCSRow(view: self)
        row.height = height
        return row
    }
    
    public class func instanceFromNib() -> JLCSPrebuiltCellView {
        return JLCSPrebuiltCellView()
    }
}
