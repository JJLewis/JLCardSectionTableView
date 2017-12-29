//
//  JLCardSectionTableView.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 25/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCardSectionTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private enum CellType {
        case top, mid, bot
    }
    private var data:JLCSTableData = []
    
    public func setTableData(_ newData:JLCSTableData) {
        data = newData
        reloadData()
    }
    
    private func cellTypeFor(indexPath:IndexPath) -> CellType {
        let section = data[indexPath.section]
        switch indexPath.row {
        case 0:
            return .top
        case 1..<section.numberOfRows+1:
            return .mid
        case section.numberOfRows+2:
            return .bot
        default:
            return .bot
        }
    }
    
    // MARK: Data Source
    public func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].numberOfRows + 2
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch cellTypeFor(indexPath: indexPath) {
        case .top:
            return 60
        case .mid:
            return 70
        case .bot:
            return 40
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let section = data[indexPath.section]
        switch cellTypeFor(indexPath: indexPath) {
        case .top:
            cell = tableView.dequeueReusableCell(withIdentifier: "JLCSTopCell", for: indexPath) as! JLCSTopTableViewCell
            (cell as! JLCSTopTableViewCell).titleLabel.text = section.title
            break
        case .mid:
            cell = tableView.dequeueReusableCell(withIdentifier: "JLCSMiddleCell", for: indexPath) as! JLCSMidTableViewCell
            // data is indexPath.row - 1
            break
        case .bot:
            cell = tableView.dequeueReusableCell(withIdentifier: "JLCSBottomCell", for: indexPath)
            break
        }
        
        return cell
    }
    
    // MARK: Setting Up
    func setup() {
        delegate = self
        dataSource = self
        
        separatorStyle = .none
        allowsSelection = false
        
        register(UINib(nibName: "JLCSTopTableViewCell", bundle: jlcsBundle), forCellReuseIdentifier: "JLCSTopCell")
        register(UINib(nibName: "JLCSMidTableViewCell", bundle: jlcsBundle), forCellReuseIdentifier: "JLCSMiddleCell")
        register(UINib(nibName: "JLCSBottomTableViewCell", bundle: jlcsBundle), forCellReuseIdentifier: "JLCSBottomCell")
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    public override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}
