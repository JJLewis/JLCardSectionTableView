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
        case top, mid, bot, single
    }
    private var data:JLCSTableData = []
    
    public func setTableData(_ newData:JLCSTableData) {
        data = newData
        reloadData()
    }
    
    private func cellTypeFor(indexPath:IndexPath) -> CellType {
        let section = data[indexPath.section]
        if section.numberOfRows == 1 {
            return .single
        }
        switch indexPath.row {
        case 0:
            return .top
        case 1..<section.numberOfRows-1:
            return .mid
        case section.numberOfRows-1:
            return .bot
        default:
            return .bot
        }
    }
    
    private func shrinkRowIfRequired(_ row:JLCSRow) {
        if let expandingRow = row.view as? JLCSExpandingCell {
            if expandingRow.shouldShrinkOnSectionChange {
                expandingRow.shrink()
            }
        }
    }
    
    private func sectionChangingFor(indexPath:IndexPath) {
        let currentSection = data[indexPath.section]
        for i in 0..<currentSection.numberOfRows {
            let row = currentSection.getRow(i)
            shrinkRowIfRequired(row)
        }
    }
    
    // MARK: Show and Hide Subsections
    private func goBackFromSubsectionFor(row:JLCSRow, indexPath:IndexPath) {
        if let parent_section = row.parentsection {
            sectionChangingFor(indexPath: indexPath)
            data.remove(at: indexPath.section)
            deleteSections(IndexSet(integer: indexPath.section), with: .right)
            data.insert(parent_section, at: indexPath.section)
            insertSections(IndexSet(integer: indexPath.section), with: .left)
        }
    }
    
    private func showSubsectionFor(row:JLCSRow, indexPath:IndexPath) {
        if let new_section = row.subsection {
            let back = new_section.backButtonRow
            back.parentsection = data[indexPath.section]
            back.showParentsectionAction = {
                self.goBackFromSubsectionFor(row: back, indexPath: indexPath)
            }
            sectionChangingFor(indexPath: indexPath)
            data.remove(at: indexPath.section)
            deleteSections(IndexSet(integer: indexPath.section), with: .left)
            data.insert(new_section, at: indexPath.section)
            insertSections(IndexSet(integer: indexPath.section), with: .right)
        }
    }
    
    // MARK: Data Source
    public func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].numberOfRows
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = data[indexPath.section].getRow(indexPath.row).height
        switch cellTypeFor(indexPath: indexPath) {
        case .top:
            return cellHeight + 40
        case .mid:
            return cellHeight
        case .bot:
            return cellHeight + 20
        case .single:
            return cellHeight + 60
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
            cell = tableView.dequeueReusableCell(withIdentifier: "JLCSMiddleCell", for: indexPath) as! JLCSTableViewCell
            (cell as! JLCSTableViewCell).cardContentView.layer.cornerRadius = 0
            break
        case .bot:
            cell = tableView.dequeueReusableCell(withIdentifier: "JLCSBottomCell", for: indexPath) as! JLCSTableViewCell
            break
        case .single:
            cell = tableView.dequeueReusableCell(withIdentifier: "JLCSSingleRowCell", for: indexPath) as! JLCSTopTableViewCell
            (cell as! JLCSTopTableViewCell).titleLabel.text = section.title
            break
        }
        
        let row = section.getRow(indexPath.row)
        (cell as! JLCSTableViewCell).setContent(view: row.view)
        row.showSubsectionAction = {
            self.showSubsectionFor(row: row, indexPath: indexPath)
        }
        (cell as! JLCSTableViewCell).tapAction = {
            if row.subsection != nil {
                row.showSubsectionAction()
            } else if row.parentsection != nil {
                row.showParentsectionAction()
            }
            row.selectedCallback()
        }
        if let expandingRow = row.view as? JLCSExpandingCell {
            expandingRow.toggleExpandCallback = {
                newHeight in
                self.beginUpdates()
                if expandingRow.shouldPushToTopOnExpand && !expandingRow.isExpanded {
                    self.scrollToRow(at: indexPath, at: .top, animated: true)
                }
                expandingRow.alternateHeight = row.height
                row.height = newHeight
                self.endUpdates()
            }
        }
        return cell
    }
    
    // MARK: Setting Up
    func setup() {
        delegate = self
        dataSource = self
        
        separatorStyle = .none
        allowsSelection = false
        autoresizingMask = UIViewAutoresizing.flexibleHeight
        
        register(UINib(nibName: "JLCSTopTableViewCell", bundle: jlcsBundle), forCellReuseIdentifier: "JLCSTopCell")
        register(UINib(nibName: "JLCSMidTableViewCell", bundle: jlcsBundle), forCellReuseIdentifier: "JLCSMiddleCell")
        register(UINib(nibName: "JLCSBottomTableViewCell", bundle: jlcsBundle), forCellReuseIdentifier: "JLCSBottomCell")
        register(UINib(nibName: "JLCSSingleRowSectionTableViewCell", bundle: jlcsBundle), forCellReuseIdentifier: "JLCSSingleRowCell")
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
