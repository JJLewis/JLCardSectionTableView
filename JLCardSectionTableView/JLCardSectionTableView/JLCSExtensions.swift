//
//  JLCSHandy.swift
//  JLCardSectionTableView
//
//  Created by Jordan Lewis on 29/12/17.
//  Copyright © 2017 Jordan Lewis. All rights reserved.
//

import Foundation

internal extension UIView {
    func fitToSuperView(view:UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: .alignAllLeft, metrics: nil, views: ["view":view]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: .alignAllLeft, metrics: nil, views: ["view":view]))
    }
}

public extension UIImage {
    static let JLCSRowDecoratorRightArrow = UIImage(named: "right_arrow", in: jlcsBundle, compatibleWith: nil)!
}
