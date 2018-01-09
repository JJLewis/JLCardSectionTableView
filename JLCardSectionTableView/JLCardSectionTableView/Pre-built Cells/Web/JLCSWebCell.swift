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
        toggleExpandCallback(self.alternateHeight)
    }
    
    public override class func instanceFromNib() -> JLCSWebCell {
        return jlcsBundle.loadNibNamed("JLCSWebCell", owner: nil, options: nil)!.first as! JLCSWebCell
    }
    
    public override func awakeFromNib() {
        self.alternateHeight = 250
        super.awakeFromNib()
        webview.allowsBackForwardNavigationGestures = false
    }
}
