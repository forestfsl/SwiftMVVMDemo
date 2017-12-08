//
//  SLBaseTableViewCell.swift
//  JianKeSwift
//
//  Created by songlin on 25/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit


class SLBaseTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        configInterface()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configInterface() {
        configSelf()
        configSubView()
        configConstraint()
    }
    
    public func configSelf() {}
    
    public func configSubView() {}
    
    public func configConstraint() {}
    
    public func configCellData(_ data: Any) {}
    
    public func calculateCellHeight(_ data: Any) {}
}
