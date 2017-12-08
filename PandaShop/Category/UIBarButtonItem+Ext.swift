//
//  UIBarButtonItem+Ext.swift
//  JianKeSwift
//
//  Created by songlin on 24/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem {
    convenience init(setHighlightedImg:String?, title:String?,target:Any?,action:Selector) {
        self.init()
        let button = UIButton(setHighlightImage:setHighlightedImg, title: title, target: target, action: action)
        self.customView = button
    }
}
