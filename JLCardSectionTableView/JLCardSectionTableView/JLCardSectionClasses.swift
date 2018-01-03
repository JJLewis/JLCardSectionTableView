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
    private var _backButton:JLCSRow?
    internal var backButton:JLCSRow {
        get {
            if let b = _backButton {
                return b
            } else {
                _backButton = JLCSRow(title: "Back")
                return _backButton!
            }
        }
        set {
            _backButton = newValue
        }
    }
    
    override public var numberOfRows: Int {
        get {
            return rows.count + 1
        }
    }
    
    override func getRow(_ index: Int) -> JLCSRow {
        if index == numberOfRows - 1 {
            return backButton
        } else {
            return super.getRow(index)
        }
    }
}

public class JLCSRow {
    let view:UIView
    public var height:CGFloat = 50
    public var selectedCallback:()->() = {}
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
