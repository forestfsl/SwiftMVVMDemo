//
//  SLProgressHUD.swift
//  JianKeSwift
//
//  Created by songlin on 24/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import SVProgressHUD


enum HUDType {
    case success
    case error
    case loading
    case info
    case progress
}

class SLProgressHUD: NSObject {
    class func initLLProgressHUD() {
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 14.0))
        SVProgressHUD.setDefaultMaskType(.none)
        SVProgressHUD.setMinimumDismissTimeInterval(1.5)
    }
    
    class func showSuccess(_ status: String) {
        self.showSLProgressHUD(type: .success, status: status)
    }
    
    class func showError(_ status: String) {
        self.showSLProgressHUD(type: .error, status: status)
    }
    
    class func showLoading(_ status:String) {
        self.showSLProgressHUD(type: .loading, status: status)
    }
    
    class func showInfo(_ status: String) {
        self.showSLProgressHUD(type: .info, status: status)
    }
    
    class func showProgress(_ status:String,_ progress:CGFloat) {
        self.showSLProgressHUD(type: .success, status: status, progress: progress)
    }
}


extension SLProgressHUD {
    class func showSLProgressHUD(type: HUDType,status:String,progress:CGFloat = 0) {
        switch type {
        case .success:
            SVProgressHUD.showSuccess(withStatus: status)
        case .error:
            SVProgressHUD.showError(withStatus: status)
        case .loading:
            SVProgressHUD.show(withStatus: status)
        case .info:
            SVProgressHUD.showInfo(withStatus: status)
        case .progress:
            SVProgressHUD.showProgress(Float(progress),status:status)
        }
    }
}
