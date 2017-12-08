//
//  consant.swift
//  JianKeSwift
//
//  Created by songlin on 24/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit





//判断系统
let IOS7 = Int(UIDevice.current.systemVersion)! >= 7 ? true : false;
let IOS8 = Int(UIDevice.current.systemVersion)! >= 8 ? true : false;
let IOS9 = Int(UIDevice.current.systemVersion)! >= 9 ? true : false;
let IOS11 = Int(UIDevice.current.systemVersion)! >= 11 ? true : false;

//判断设备
func isIPhoneX() -> Bool {
    if UIScreen.main.bounds.height == 812 {
        return true
    }
    return false
}



let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height


//MARK:NAV 高度
let kNavHeight = isIPhoneX() ? 88 : 64
//MARK:TABBAR高度
let kTabBarHeight = isIPhoneX() ? 83 : 49

//服务器判断
let isDebug = false

let kApiRequestUrl = isDebug ? "" : "https://api.jianke.com"
let kImgApiRequestUrl = isDebug ? "" : "http://img.jianke.net"
let kCodeExchangeRuleUrl = isDebug ? "" : "http://testm.jianke.com/dhgz/index.html"
let kNewApiRequestUrl = isDebug ? "" : "https://mbp.jianke.com/"
let kMainApiUrl = isDebug ? "" : "mbm/mall/api"



//UIColor
let kTableVBackColor = UIColor.colorWithHexString("#eeeeee")
let kCollectionVBackColor = UIColor.colorWithHexString("#eeeeee")


// 自定义打印方法
func printLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(fileName):(\(lineNum))-\(message)")
        
    #endif
}
