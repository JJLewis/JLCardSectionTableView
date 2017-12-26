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
        
        let section = JLCSSection(title: "Hello World")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

