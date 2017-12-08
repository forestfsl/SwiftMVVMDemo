//
//  RowNColItemCell.swift
//  PandaShop
//
//  Created by songlin on 8/12/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit


class RowNColItemCell: BaseCollectionViewCell {
    
    @IBOutlet weak var productImageV: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func configCellData(_ data: AnyObject) {
        let roomModel = data as? RoomModel
        productImageV.SL_setImage(withUrlString: roomModel?.headImg, placeholderImgName: "placeholder")
        productLabel.text = roomModel?.productName
        productPriceLabel.text = String(format:"%.2f",(roomModel?.marketPrice)!/100)
    }
    
    override func configSubViews() {
        
    }
}
