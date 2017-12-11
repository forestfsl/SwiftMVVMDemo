//
//  RecommendCell.swift
//  PandaShop
//
//  Created by songlin on 8/12/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit

class RecommendCell: BaseCollectionViewCell {
    var floorModel : FloorModel?
    
    override func configSubViews() {
        super.configSubViews()
        
    collectionView?.register(RecommendItemCell.nib(), forCellWithReuseIdentifier: RecommendItemCell.reuseIdentifier())
    }
    
    override func configCellData(_ data: AnyObject) {
       floorModel = data as? FloorModel
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (floorModel?.rooms!.count)!
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendItemCell.reuseIdentifier(), for: indexPath) as? RecommendItemCell
        
        cell?.configCellData((floorModel?.rooms![indexPath.row])!)
        
        return cell!
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:kScreenW / 2 ,height:200)
    }
}
