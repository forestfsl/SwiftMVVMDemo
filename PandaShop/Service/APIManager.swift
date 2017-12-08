//
//  APIManager.swift
//  JianKeSwift
//
//  Created by songlin on 25/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import Moya



enum APIManager {
    case GetHomeList //获取首页列表
    case GetDetail(Int) //获取详情页
}

extension APIManager: TargetType {
    // The target's base URL
    var baseURL: URL {
         return URL.init(string: kApiRequestUrl)!;
    }
     //The path to be appended to baseURL to from the full URL
    var path: String {
        switch self {
        case .GetHomeList:
            return "HomePage/getHomePageListsNew"
        default:
            return ""
        }
    }
    
    // The method to request (eg:get,post)
    var method: Moya.Method  {
        return .post
    }
    // Provides stub data for use in testing.
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    // The type of HTTP task to be performed.
    var task: Task {
         return .requestPlain
    }
    
    var headers: [String : String]? {
         return ["Content-type": "application/json"]
    }
    
   
   
    
}
