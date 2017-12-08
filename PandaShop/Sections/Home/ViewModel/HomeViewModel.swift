//
//  HomeViewModel.swift
//  JianKeSwift
//
//  Created by songlin on 25/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Moya
import Alamofire
import MJRefresh
import ObjectMapper


class HomeViewModel: BaseViewModel {
    var floorsModel : HomeModel?
    func getHomePageList() -> Void {
        //模拟假数据

        let  jsonString = fromResource("HomePage", "json",false)

        floorsModel = Mapper<HomeModel>().map(JSON:jsonString as! [String : Any])
    }
}


//class HomeViewModel: BaseViewModel {
//    //首页数据
//    var homeListData : Variable<HomeModel?> = Variable(nil)
//
//    func getHomeList() -> Observable<HomeModel> {
//        return provider.request(.GetHomeList) { [unowned self] result in
//            switch result {
//            case let .success(moyaResponse):
//                do {
//
//
//                    let data = try moyaResponse.mapJSON() as? Observable<Any>
//                    data?.mapObject(type: HomeModel.self).bind(to: self.homeListData).disposed(by: self.disposeBag)
//
//                }
//                catch {
//                    // show an error to your user
//            }
//            case let .failure(error):
//                print("error",error);
//                // this means there was a network failure - either the request
//                // wasn't sent (connectivity), or no response was received (server
//                // timed out).  If the server responds with a 4xx or 5xx error, that
//                // will be sent as a ".success"-ful response.
//
//            }
//            } as! Observable<HomeModel>
//
//    }
//
//}





