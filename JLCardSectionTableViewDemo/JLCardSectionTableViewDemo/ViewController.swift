//
//  ViewController.swift
//  JLCardSectionTableViewDemo
//
//  Created by Jordan Lewis on 25/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import UIKit
import JLCardSectionTableView

class ViewController: UIViewController {
    
    @IBOutlet var table:JLCardSectionTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var section = JLCSSection(title: "Hello World")
        let a = JLCSRow(title: "a")
        section.addRow(a)
        
        var section2 = JLCSSection(title: "Nice to meet you")
        let b = JLCSRow(title: "b")
        section2.addRow(b)
        
        table.setTableData([section, section2])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

