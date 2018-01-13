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
        prebuiltsection.addRow(picker.row)
        let multibutton = JLCSMultiButtonCell.instanceFromNib()
        multibutton.addButtonWithTitle("Cancel") { (sender) in
            print("Cancel Pressed")
        }
        multibutton.addButtonWithTitle("Save") { (sender) in
            print("Save Pressed")
        }
        prebuiltsection.addRow(multibutton.row)
        let web = JLCSWebCell.instanceFromNib()
        web.titleLabel.text = "jjlewis"
        web.showWebsite(withURL: URL(string: "https://github.com/jjlewis")!)
        prebuiltsection.addRow(web.row)
        let label = JLCSLabelCell.instanceFromNib()
        label.titleLabel.text = "Yo Yo this is just a plain label."
        prebuiltsection.addRow(label.row)
        
        let websection = JLCSWebSection(title: "jjlewis section", url: URL(string: "https://github.com/jjlewis")!)
        
        let account = JLCSSection(title: "Account")
        let updateDetails = JLCSRow(title: "Update Details", decorator:UIImage.JLCSRowDecoratorRightArrow)
        updateDetails.selectedCallback = {
            print("Hello world")
        }
        let buyCredits = JLCSRow(title: "Buy Credits")
        account.addRow(updateDetails)
        account.addRow(buyCredits)
        
        let creditsSection = JLCSSubSection(title: "Buy Credits")
        let tenCredits = JLCSRow(title: "Buy 10 Credits")
        let twentyCredits = JLCSRow(title: "Buy 20 Credits")
        let thirtyCredits = JLCSRow(title: "Buy 30 Credits")
        creditsSection.addRow(tenCredits)
        creditsSection.addRow(twentyCredits)
        creditsSection.addRow(thirtyCredits)
        let dbutton = JLCSMultiButtonCell.instanceFromNib()
        dbutton.addButtonWithTitle("Back") { (sender) in
            dbutton.row.showParentsectionAction()
        }
        dbutton.addButtonWithTitle("Next") { (sender) in
            dbutton.row.showSubsectionAction()
        }
        creditsSection.addRow(dbutton.row)
        creditsSection.backButtonRow = dbutton.row
        buyCredits.setSubsection(section: creditsSection)

        let paywithSection = JLCSSubSection(title: "Pay With", backButtonWithTitle: "Cancel")
        let master = JLCSRow(title: "Mastercard")
        let visa = JLCSRow(title: "Visa")
        let paypal = JLCSRow(title: "Paypal")
        paywithSection.addRows([master, visa, paypal])
        tenCredits.setSubsection(section: paywithSection)
        twentyCredits.setSubsection(section: paywithSection)
        thirtyCredits.setSubsection(section: paywithSection)
        dbutton.row.setSubsection(section: paywithSection)

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
        let gethelp = JLCSRow(title: "Get help/support", decorator: UIImage.JLCSRowDecoratorRightArrow)
        help.addRow(gethelp)
        let websubsection = JLCSWebSubSection(title: "goonncode.com", url: URL(string:"http://goonncode.com")!)
        gethelp.setSubsection(section: websubsection)
        
        let rate = JLCSSection(title: "Rate")
        let rateapp = JLCSRow(title: "Rate this app")
        rate.addRow(rateapp)
        
        table.setTableData([prebuiltsection, websection, account, settings, about, help, rate])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

