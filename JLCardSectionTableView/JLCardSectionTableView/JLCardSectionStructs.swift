//
//  JLCardSectionStructs.swift
//  JLCardSectionTableView
//
//  Created by jordanlewis on 26/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import Foundation

struct JLCSRow {
    let title:String!
    let selectedCallback:(JLCSTableViewCell)->()
}

struct JLCSSection {
    let title:String!
    private var rows:[JLCSRow]!
    var numberOfRows:Int {
        get {
            return rows.count + 2
        }
    }
    
    mutating func addRow(_ row:JLCSRow) {
        rows.append(row)
    }
}

typealias JLCSTableData = [JLCSSection]
