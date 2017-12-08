//
//  String+Ext.swift
//  JianKeSwift
//
//  Created by songlin on 24/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit

extension String {
    //截取第一个到任意位置
    //parameter end 结束的位置
    //Returns: 截取后的字符串
    func stringCut(end: Int) -> String {
        print(self.characters.count)
        if !(end < characters.count) {
            return "截取超出范围"
        }
        let sInde = self.index(startIndex, offsetBy: end)
        return String(self[..<sInde])
    }
}
