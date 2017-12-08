//
//  SLNavigationController.swift
//  JianKeSwift
//
//  Created by songlin on 24/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit

class SLNavigationController: UINavigationController,UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        interactivePopGestureRecognizer?.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        var title: String?
        
        if childViewControllers.count > 0 {
            title = "返回"
            if childViewControllers.count == 1 {
                title = childViewControllers.first?.title
            }
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(setHighlightedImg:"navigationbar_back_withtext", title: title, target: self, action: #selector(popVC))
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc fileprivate func popVC() {
        popViewController(animated: true)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return childViewControllers.count != 1
    }
}
