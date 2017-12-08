//
//  SLBaseViewController.swift
//  JianKeSwift
//
//  Created by songlin on 24/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit


class SLBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configInterface()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configInterface(){
        self.configSelf()
        self.configSubView()
        self.configConstraint()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super .init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    //配置自身
    public func configSelf() {}
    //配置subView
    public func configSubView() {}
    //配置约束
    public func configConstraint() {}
    //配置数据
    public func configData () {}
}
