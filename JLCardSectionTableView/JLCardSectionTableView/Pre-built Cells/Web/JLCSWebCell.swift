//
//  JLCSWebCell.swift
//  JLCardSectionTableView
//
//  Created by jordanlewis on 9/1/18.
//  Copyright © 2018 Jordan Lewis. All rights reserved.
//

import UIKit
import WebKit

public class JLCSWebCell: JLCSExpandingCell {

    @IBOutlet public var titleLabel: UILabel!
    @IBOutlet public var button: UIButton!
    @IBOutlet public var webview: WKWebView!
    
    public func showWebsite(withURL url:URL) {
        webview.load(URLRequest(url: url))
    }
    
    @IBAction func buttonPressed(_ sender:UIButton) {
        toggleExpand()
        sender.setImage(isExpanded ? UIImage.JLCSRowDecoratorUpArrow:UIImage.JLCSRowDecoratorDownArrow, for: .normal)
    }
    
    public override class func instanceFromNib() -> JLCSWebCell {
        return jlcsBundle.loadNibNamed("JLCSWebCell", owner: nil, options: nil)!.first as! JLCSWebCell
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        webview.allowsBackForwardNavigationGestures = false
        
        // Set slight shadow
        minimisedView.layer.shadowColor = UIColor.black.cgColor
        minimisedView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        minimisedView.layer.shadowRadius = 2
        minimisedView.layer.shadowOpacity = 0.25
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.alternateHeight = 250
    }
}
