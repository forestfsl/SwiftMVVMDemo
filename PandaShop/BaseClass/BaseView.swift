//
//  BaseView.swift
//  PandaShop
//
//  Created by songlin on 8/12/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configInterface()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
    }
    
    func configInterface() {
        configSubviews()
        configConstraint()
        configViewData()
    }
    
    func configSubviews() {
        
    }
    
    func configViewData() {
        
    }
    
    func configConstraint() {
        
    }
}
