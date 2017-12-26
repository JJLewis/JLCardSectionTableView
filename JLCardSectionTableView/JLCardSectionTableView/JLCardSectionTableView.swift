//
//  JLCardSectionTableView.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 25/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import UIKit

public class JLCardSectionTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private var data:JLCSTableData = []
    
    func setTableData(_ newData:JLCSTableData) {
        data = newData
        reloadData()
    }
    
    // MARK: Data Source
    public func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].numberOfRows
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let section = data[indexPath.section]
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "JLCSTopCell", for: indexPath) as! JLCSTopTableViewCell
            
            break
        case 1..<section.numberOfRows-1:
            cell = tableView.dequeueReusableCell(withIdentifier: "JLCSMiddleCell", for: indexPath) as! JLCSMidTableViewCell

            break
        case section.numberOfRows-1:
            cell = tableView.dequeueReusableCell(withIdentifier: "JLCSBottomCell", for: indexPath)
            break
        default:
            break
        }
        
        return cell
    }
    
    // MARK: Setting Up
    func setup() {
        delegate = self
        dataSource = self
        
        register(UINib(nibName: "JLCSTopTableViewCell", bundle: nil), forCellReuseIdentifier: "JLCSTopCell")
        register(UINib(nibName: "JLCSMiddleTableViewCell", bundle: nil), forCellReuseIdentifier: "JLCSMiddleCell")
        register(UINib(nibName: "JLCSBottomTableViewCell", bundle: nil), forCellReuseIdentifier: "JLCSBottomCell")
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
