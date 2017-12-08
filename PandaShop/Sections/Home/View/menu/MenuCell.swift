//
//  MenuCell.swift
//  PandaShop
//
//  Created by songlin on 8/12/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit

class MenuCell: BaseCollectionViewCell {
    var floorModel : FloorModel?
    
    
    override func configCellData(_ data: AnyObject) {
        floorModel = data as? FloorModel
        
    }
    override func configSubViews() {
        super .configSubViews()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (floorModel?.rooms?.count)!
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCell.reuseIdentifier(), for: indexPath) as? MenuItemCell
        cell?.configCellData((floorModel?.rooms![indexPath.row])!)
        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO
        NSLog("MenuCell 被点击了")
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:112,height:120)
    }
}
