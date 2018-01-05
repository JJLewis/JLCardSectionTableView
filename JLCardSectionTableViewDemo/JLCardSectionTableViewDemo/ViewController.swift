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
        
        let prebuiltsection = JLCSSection(title: "Pre-Built Cells")
        let toggle = JLCSRow(view: JLCSSwitchCell.instanceFromNib())
        prebuiltsection.addRow(toggle)
        let textfield = JLCSRow(view: JLCSTextfieldCell.instanceFromNib())
        prebuiltsection.addRow(textfield)
        let slider = JLCSRow(view: JLCSSliderCell.instanceFromNib())
        prebuiltsection.addRow(slider)
        let segmented = JLCSRow(view: JLCSSegmentedControlCell.instanceFromNib())
        prebuiltsection.addRow(segmented)
        let picker = JLCSPickerCell.instanceFromNib()
        picker.setPickerOptions(["a", "b", "c", "d", "e", "f", "g", "h", "i"])
        prebuiltsection.addRow(picker.makeRowFromSelf())
        let multibutton = JLCSMultiButtonCell.instanceFromNib()
        multibutton.addButtonWithTitle("Cancel")
        multibutton.addButtonWithTitle("Save")
        multibutton.buttonPressedCallback = {
            button, index in
            print("Button pressed was number \(index) with title \(button.title(for: .normal)!)")
        }
        prebuiltsection.addRow(multibutton.makeRowFromSelf())
        
        let account = JLCSSection(title: "Account")
        let updateDetails = JLCSRow(title: "Update Details", decorator:UIImage.JLCSRowDecoratorRightArrow)
        updateDetails.selectedCallback = {
            print("Hello world")
        }
        let buyCredits = JLCSRow(title: "Buy Credits")
        
        let creditsSection = JLCSSubSection(title: "Buy Credits")
        let tenCredits = JLCSRow(title: "Buy 10 Credits")
        let twentyCredits = JLCSRow(title: "Buy 20 Credits")
        let thirtyCredits = JLCSRow(title: "Buy 30 Credits")
        
        let paywithSection = JLCSSubSection(title: "Pay With", backButtonWithTitle: "Cancel")
        let master = JLCSRow(title: "Mastercard")
        let visa = JLCSRow(title: "Visa")
        let paypal = JLCSRow(title: "Paypal")
        paywithSection.addRows([master, visa, paypal])
        tenCredits.setSubsection(section: paywithSection)
        twentyCredits.setSubsection(section: paywithSection)
        thirtyCredits.setSubsection(section: paywithSection)
        
        creditsSection.addRow(tenCredits)
        creditsSection.addRow(twentyCredits)
        creditsSection.addRow(thirtyCredits)
        
        buyCredits.setSubsection(section: creditsSection)
        
        account.addRow(updateDetails)
        account.addRow(buyCredits)
        
        let settings = JLCSSection(title: "Settings")
        let pushView = Bundle.main.loadNibNamed("CustomCellView", owner: self, options: nil)!.first as! CustomCellView
        pushView.titleLabel.text = "Push Notifications: Try toggle the switch"
        let pushNotifications = JLCSRow(view: pushView)
        let tsandcs = JLCSRow(title: "Terms of Services")
        let privacypolicy = JLCSRow(title: "Privacy Policy")
        let contactus = JLCSRow(title: "Contact Us")
        let logout = JLCSRow(title: "Logout")
        settings.addRow(pushNotifications)
        settings.addRow(tsandcs)
        settings.addRow(privacypolicy)
        settings.addRow(contactus)
        settings.addRow(logout)
        
        let about = JLCSSection(title: "About Handpic'd")
        let aboutthisapp = JLCSRow(title: "About this app")
        about.addRow(aboutthisapp)
        
        let help = JLCSSection(title: "Help & Support")
        let gethelp = JLCSRow(title: "Get help/support")
        help.addRow(gethelp)
        
        let rate = JLCSSection(title: "Rate")
        let rateapp = JLCSRow(title: "Rate this app")
        rate.addRow(rateapp)
        
        table.setTableData([prebuiltsection, account, settings, about, help, rate])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

