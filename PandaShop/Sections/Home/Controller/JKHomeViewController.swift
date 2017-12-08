//
//  JKHomeViewController.swift
//  JianKeSwift
//
//  Created by songlin on 24/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import Moya
import MJRefresh
import RxSwift


let kItemMargin: CGFloat = 10
let kHeaderViewH: CGFloat = 50
let kCycleViewH = kScreenW * 3 / 8
let kGameViewH: CGFloat = 90

let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"
let kHomeItemCellID = "kHomeItemCellID"
let kNormalItemW = (kScreenW - 3 * kItemMargin) / 2
let kNormalItemH = kNormalItemW * 3 / 3
let kPrettyItemH = kNormalItemW * 4 / 3

class JKHomeViewController: SLBaseViewController {
    
    lazy var homeVM : HomeViewModel = HomeViewModel()
    //定义collectionView
    lazy var collectionView: UICollectionView = {[unowned self] in
        //创建布局
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.scrollDirection = .vertical
        
        //创建UICollectionView
        let collectionView = UICollectionView(frame:CGRect.zero,collectionViewLayout:layout)
        collectionView.backgroundColor = kCollectionVBackColor
        collectionView.dataSource = self
        collectionView.delegate = self
//        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        //注册cell

        collectionView.register(BannerCell.nib(), forCellWithReuseIdentifier: BannerCell.reuseIdentifier())
        collectionView.register(BannerCell.classForCoder(), forCellWithReuseIdentifier: BannerCell.reuseIdentifier())
        return collectionView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeVM.getHomePageList()
        
    }
    
    override func configSelf() {
        self.view.backgroundColor = UIColor.colorWithHexString("#eeeeee")
    }
    
    override func configConstraint() {
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    override func configSubView() {
        //添加collectionview
        view.addSubview(collectionView)
      
        
    }
    
    func fetchCellIdentifier(_ indexPath : IndexPath) ->  String {
 
        switch indexPath.row {
        case 0,1,4:
            return "BannerCell"
        case 2:
            return "MenuCell"
        case 3,5:
            return "RowNColCell"
        case 6:
            return "TitleCell"
        case 7:
            return "RecommendCell"
        default:
            return "BannerCell"
        }
        
    }
    
}

//MARK:- 遵守UICollectionView的数据源
extension JKHomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return (self.homeVM.floorsModel?.data?.floors?.count)!
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fetchCellIdentifier(indexPath), for: indexPath) as! BaseCollectionViewCell
        cell.configCellData((self.homeVM.floorsModel?.data?.floors![indexPath.row])!)
        
        return cell
    }
}
// MARK:- 遵守UICollectionView的代理协议
extension JKHomeViewController : UICollectionViewDelegate {
    
}


extension JKHomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0,1,4:
              return CGSize(width:kScreenW,height:160)
        case 2:
            return CGSize(width:kScreenW,height:200)
        case 3,5:
            return CGSize(width:kScreenW,height:200)
        case 6:
            return CGSize(width:kScreenW,height:220)
        default:
            return CGSize(width:kScreenW,height:0.1)
        }
      
    }
}
