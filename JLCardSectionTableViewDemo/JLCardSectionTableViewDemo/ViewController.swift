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
        
        var account = JLCSSection(title: "Account")
        var updateDetails = JLCSRow(title: "Update Details", decorator:UIImage.JLCSRowDecoratorRightArrow)
        updateDetails.selectedCallback = {
            print("Hello world")
        }
        let buyCredits = JLCSRow(title: "Buy Credits")
        account.addRow(updateDetails)
        account.addRow(buyCredits)
        
        var settings = JLCSSection(title: "Settings")
        let pushNotifications = JLCSRow(title: "Push Notifications")
        let tsandcs = JLCSRow(title: "Terms of Services")
        let privacypolicy = JLCSRow(title: "Privacy Policy")
        let contactus = JLCSRow(title: "Contact Us")
        let logout = JLCSRow(title: "Logout")
        settings.addRow(pushNotifications)
        settings.addRow(tsandcs)
        settings.addRow(privacypolicy)
        settings.addRow(contactus)
        settings.addRow(logout)
        
        var about = JLCSSection(title: "About Handpic'd")
        let aboutthisapp = JLCSRow(title: "About this app")
        about.addRow(aboutthisapp)
        
        var help = JLCSSection(title: "Help & Support")
        let gethelp = JLCSRow(title: "Get help/support")
        help.addRow(gethelp)
        
        var rate = JLCSSection(title: "Rate")
        let rateapp = JLCSRow(title: "Rate this app")
        rate.addRow(rateapp)
        
        table.setTableData([account, settings, about, help, rate])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

