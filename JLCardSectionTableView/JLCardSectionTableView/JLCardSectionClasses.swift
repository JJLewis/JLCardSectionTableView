//
//  JLCardSectionStructs.swift
//  JLCardSectionTableView
//
//  Created by jordanlewis on 26/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import Foundation

private class JLCSRowDefault {
    private let title:String
    private let image:UIImage?
    internal var view:JLCSDefaultContent {
        get {
            let content = jlcsBundle.loadNibNamed("JLCSDefaultContent", owner: nil, options: nil)!.first as! JLCSDefaultContent
            content.titleLabel.text = title
            content.imageView.image = image
            return content
        }
    }
    
    public init(title _title:String, decorator:UIImage?) {
        title = _title
        image = decorator
    }
}

public class JLCSSubSection:JLCSSection {
    private var _backButtonRow:JLCSRow?
    internal var backButtonRow:JLCSRow {
        get {
            if let b = _backButtonRow {
                return b
            } else {
                _backButtonRow = JLCSRow(title: "Back")
                return _backButtonRow!
            }
        }
        set {
            _backButtonRow = newValue
        }
    }
    
    override public var numberOfRows: Int {
        get {
            return rows.count + 1
        }
    }
    
    override func getRow(_ index: Int) -> JLCSRow {
        if index == numberOfRows - 1 {
            return backButtonRow
        } else {
            return super.getRow(index)
        }
    }
    
    public func setBackButtonWithTitle(title:String) {
        backButtonRow = JLCSRow(title: title)
    }
    
    // MARK: Initialisers
    public convenience init(title _title: String) {
        self.init(title: _title, backButton: nil)
    }
    
    public convenience init(title _title: String, backButtonWithTitle title:String) {
        self.init(title: _title, rows: [], backButtonWithTitle: title)
    }
    
    public convenience init(title _title: String, backButton aBackButton:JLCSRow?) {
        self.init(title: _title, rows: [], backButton: aBackButton)
    }
    
    public convenience init(title _title: String, rows _rows: [JLCSRow], backButtonWithTitle title:String) {
        self.init(title: _title, rows: _rows, backButton: JLCSRow(title: title))
    }
    
    public init(title _title: String, rows _rows: [JLCSRow], backButton aBackButton:JLCSRow?) {
        super.init(title: _title, rows: _rows)
        _backButtonRow = aBackButton
    }
}

public class JLCSRow {
    let view:UIView
    public var height:CGFloat = 50
    public var selectedCallback:()->() = {}
    public var showSubsectionAction:()->() = {}
    public var showParentsectionAction:()->() = {}
    internal var subsection:JLCSSubSection?
    internal var parentsection:JLCSSection?
    
    public func setSubsection(section:JLCSSubSection) {
        subsection = section
    }
    
    public convenience init(title:String) {
        self.init(title: title, decorator: nil)
    }
    
    public convenience init(title:String, decorator:UIImage?) {
        self.init(view: JLCSRowDefault(title: title, decorator: decorator).view)
    }
    
    public init(view _view:UIView) {
        view = _view
    }
}

public class JLCSSection {
    public let title:String!
    fileprivate var rows:[JLCSRow] = []
    public var numberOfRows:Int {
        get {
            return rows.count
        }
    }
    
    public func addRow(_ row:JLCSRow) {
        rows.append(row)
    }
    
    public func addRows(_ _rows:[JLCSRow]) {
        for row in _rows {
            rows.append(row)
        }
    }
    
    public func addRows(prebuiltCells _rows:[JLCSPrebuiltCellView]) {
        addRows(_rows.map { $0.row })
    }
    
    internal func getRow(_ index:Int) -> JLCSRow {
        return rows[index]
    }
    
    public convenience init(title _title:String) {
        self.init(title: _title, rows: [])
    }
    
    public init(title _title:String, rows _rows:[JLCSRow]) {
        title = _title
        rows = _rows
    }
}

public typealias JLCSTableData = [JLCSSection]
