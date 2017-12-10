//
//  BaseViewModel.swift
//  PandaShop
//
//  Created by songlin on 30/11/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Moya
import Alamofire
import MJRefresh

enum SLRefreshStatus {
    case none
    case beginHeaderRefresh
    case endHeaderRefresh
    case beginFooterRefresh
    case endFooterRefresh
    case noMoreData
}

class BaseViewModel: NSObject {
    var title : String?
    var params: [String:Any]?
    
    override init() {
        super.init()
    }
    
    func initWithViewModel(_ model:BaseModel?,_ params:[String:Any]?) {
        title = params!["title"] as? String
    }
    
}

//public func defaultAlamofireManager() -> Manager {
//
//    let configuration = URLSessionConfiguration.default
//
//    configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
//
//    let policies: [String: ServerTrustPolicy] = [
//        "ap.grtstar.cn": .disableEvaluation
//    ]
//    let manager = Alamofire.SessionManager(configuration: configuration,serverTrustPolicyManager: ServerTrustPolicyManager(policies: policies))
//
//    manager.startRequestsImmediately = false
//
//    return manager
//}
//
//public func endpointMapping<Target: TargetType>(target: Target) -> Endpoint<Target> {
//
//    print("请求连接：\(target.baseURL)\(target.path) \n方法：\(target.method)\n任务：\(String(describing: target.task)) ")
//
//    return MoyaProvider.defaultEndpointMapping(for: target)
//}
//
//
//
//class BaseViewModel: NSObject {
//
//    var disposeBag = DisposeBag()
//
//
//
//    let provider = MoyaProvider<APIManager>(endpointClosure: endpointMapping, manager: defaultAlamofireManager(), plugins: [RequestPlguin(),netWorkActivityPlugin])
//
//}
//

