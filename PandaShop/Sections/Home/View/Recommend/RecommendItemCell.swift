//
//  RecommendItemCell.swift
//  PandaShop
//
//  Created by songlin on 8/12/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit

class RecommendItemCell: BaseCollectionViewCell {
    
    @IBOutlet weak var productImageV: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var productDesLabel: UILabel!
    
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func configSubViews() {
        
    }
    
    override func configCellData(_ data: AnyObject) {
        let roomModel = data as? RoomModel
        productImageV.SL_setImage(withUrlString: roomModel?.headImg, placeholderImgName: "placeholder")
        productNameLabel.text = roomModel?.title;
        productDesLabel.text = roomModel?.introduction
        productPriceLabel.text = roomModel?.marketPrice
        
    }
}
