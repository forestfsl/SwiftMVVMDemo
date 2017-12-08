//
//  RequestPlugin.swift
//  JianKeSwift
//
//  Created by songlin on 25/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import Moya
import Result


let netWorkActivityPlugin = NetworkActivityPlugin {(change,_) -> () in
    
    switch(change){
    case .ended:
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    case .began:
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}

public final class RequestPlguin: PluginType {
    // Called immediately before a request is sent over the network (or stubbed).
    public func willSend(_ request: RequestType, target: TargetType) {
    }
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let response):
            let json:Dictionary? = try! JSONSerialization.jsonObject(with: response.data,                                                                     options:.allowFragments) as! [String: Any]
            print(json as Any)
            SLProgressHUD.showSuccess("加载成功")
        case .failure:
            SLProgressHUD.showError("加载失败")
            break
        }
        
    }
}
