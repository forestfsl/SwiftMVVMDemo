//
//  BannerCell.swift
//  JianKeSwift
//
//  Created by songlin on 25/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit


class BannerCell: BaseCollectionViewCell {

     var bannerView: BannerView!
    
    override func configCellData(_ data: AnyObject) {
        let floorModel = data as? FloorModel
        configADImages(array: (floorModel?.rooms)!)
  
        
    }
    
    
    
    override func configSubViews() {
//        self.backgroundColor = UIColor.green
        bannerView = BannerView.init(frame: CGRect.init(x:0,y:0,width:kScreenW,height:160))
          bannerView.isAutoScroll = true
        self.contentView .addSubview(bannerView)

    }

    
    func configADImages(array:[RoomModel]) {
        var imgArray = [String]()
        for roomModel in array {
            imgArray.append((roomModel.headImg)!)
        }
      
        bannerView.imgArr = imgArray
        
    }
    
}

