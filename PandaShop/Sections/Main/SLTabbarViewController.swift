//
//  SLTabbarViewController.swift
//  JianKeSwift
//
//  Created by songlin on 24/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit

class SLTabbarViewController: UITabBarController {
    override func viewDidLoad() {
        guard let jsonPath = Bundle.main.path(forResource: "menu.json", ofType: nil) else {
            return
        }
        guard let jsonData = NSData(contentsOfFile:jsonPath) else {
            return
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) else {
            return
        }
        
        let anyObject = json as AnyObject
        
        //key 为String，value：Any
        guard let dict = anyObject.self as? [String:Any] else {
            return
        }
        guard let dictArray = dict["tabbar_items"] as? [[String: Any]] else {
            return
        }
        
        for dict in dictArray {
            guard let vcName = dict["page"] as? String else {
                continue
            }
            guard let title = dict["title"] as? String else {
                continue
            }
            guard let imageName = dict["normal_icon"] as? String else {
                continue
            }
            addChildViewVC(vcName: vcName, title: title, imageName: imageName)
        }
    }
    
    func addChildViewVC(vcName:String, title:String,imageName:String) {
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let clsName = namespace + "." + vcName
        let cls = NSClassFromString(clsName) as! UIViewController.Type
       
        let vc = cls.init()
        vc.title = title
        
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.gray], for: UIControlState.normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.blue], for: UIControlState.selected)
        
        vc.tabBarItem.image = UIImage(named: imageName)
        
        vc.tabBarItem.selectedImage = UIImage(named: "\(imageName)_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let navVC = SLNavigationController.init(rootViewController: vc)
        
        addChildViewController(navVC)
        
    }
}
