//
//  UILabel+Ext.swift
//  JianKeSwift
//
//  Created by songlin on 24/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(text:String,font:CGFloat,textColor:UIColor,maxWidth:CGFloat = 0) {
        self.init()
        self.text = text
        self.font = UIFont.systemFont(ofSize: font)
        self.textColor = textColor
        if maxWidth > 0 {
            self.preferredMaxLayoutWidth = maxWidth
            self.numberOfLines = 0
        }
    }
    
    class func createLabel(_ frame:CGRect = CGRect.zero,font: UIFont = UIFont.systemFont(ofSize: 14),
                           textColor:UIColor = UIColor.white,
                           textAlignment:NSTextAlignment = .left,
                           text:String = "") -> UILabel {
        let label = UILabel()
        label.frame = frame
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.text = text
        return label
    }
}
