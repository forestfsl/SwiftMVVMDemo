//
//  MenuItemCell.swift
//  PandaShop
//
//  Created by songlin on 8/12/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit

class MenuItemCell: BaseCollectionViewCell {
    
    
    @IBOutlet weak var itemImageV: UIImageView!
    
    @IBOutlet weak var itemLabel: UILabel!
    override func configSubViews() {
        
    }
    
    override func configCellData(_ data: AnyObject) {
        let roomModel = data as? RoomModel
        itemImageV.SL_setImage(withUrlString: roomModel?.headImg, placeholderImgName: "placeholder")
        itemLabel.text = roomModel?.title
    }
}
