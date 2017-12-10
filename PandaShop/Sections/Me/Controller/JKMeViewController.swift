//
//  JKMeViewController.swift
//  JianKeSwift
//
//  Created by songlin on 24/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit


class JKMeViewController: UITableViewController {
    
    @IBOutlet weak var userHeaderView: UserHeaderView! //用户头部view
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK: - 方法封装
extension JKMeViewController {
    //我的订单
    fileprivate func myOrderList() {
        
    }
    //地址管理
    fileprivate func manageAddress() {
        
    }
    
    //我的收藏
    fileprivate func myCollection() {
        
    }
    //常见问题
    fileprivate func question() {
        
    }
    //关于我们
    fileprivate func aboutUS() {
        
        
    }
}

//MARK: - 代理
extension JKMeViewController  {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            //我的订单
            myOrderList()
        case 1:
            if indexPath.row == 0 {
                 //地址管理
            }else {
                 //我的收藏
            }
           
        case 2:
            if indexPath.row == 0  {
                //常见问题
            }else {
                 //关于我们
            }
           
        default:
            break
        }
    }
}


