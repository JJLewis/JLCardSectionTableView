//
//  JLCardSectionStructs.swift
//  JLCardSectionTableView
//
//  Created by jordanlewis on 26/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import Foundation

private struct JLCSRowDefault {
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

public struct JLCSRow {
    let view:UIView
    public var height:CGFloat = 50
    public var selectedCallback:()->() = {}
    internal var subsection:JLCSSection?
    internal var parentsection:JLCSSection?
    
    public mutating func setSubsection(section:JLCSSection) {
        subsection = section
    }
    
    public init(title:String) {
        self.init(title: title, decorator: nil)
    }
    
    public init(title:String, decorator:UIImage?) {
        self.init(view: JLCSRowDefault(title: title, decorator: decorator).view)
    }
    
    public init(view _view:UIView) {
        view = _view
    }
}

public struct JLCSSection {
    public let title:String!
    private var rows:[JLCSRow] = []
    public var numberOfRows:Int {
        get {
            return rows.count
        }
    }
    
    public mutating func addRow(_ row:JLCSRow) {
        rows.append(row)
    }
    
    func getRow(_ index:Int) -> JLCSRow {
        return rows[index]
    }
    
    public init(title _title:String) {
        title = _title
    }
    
    public init(title _title:String, rows _rows:[JLCSRow]) {
        title = _title
        rows = _rows
    }
}

public typealias JLCSTableData = [JLCSSection]
