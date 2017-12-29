//
//  JLCardSectionStructs.swift
//  JLCardSectionTableView
//
//  Created by jordanlewis on 26/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import Foundation

public struct JLCSRow {
    public let title:String!
    public var selectedCallback:()->() = {}
    
    public init(title _title:String) {
        title = _title
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
    
    public init(title _title:String) {
        title = _title
    }
    
    public init(title _title:String, rows _rows:[JLCSRow]) {
        title = _title
        rows = _rows
    }
}

public typealias JLCSTableData = [JLCSSection]
