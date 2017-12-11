//
//  JKHomeModel.swift
//  JianKeSwift
//
//  Created by songlin on 25/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import ObjectMapper



class HomeModel: Mappable {
    var code: String?
    var data: FloorModels?
    
    
    //下面两个方法必须实现
    required init?(map: Map) {
    
    }
    
    public func mapping(map: Map) {
        code <- map["code"]
        data <- map["data"]
        print("code,data",code ?? "没有值",data ?? "没有值")
    }
    
}

class FloorModels: Mappable {
    var floors: [FloorModel]?
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        floors <- map["floors"]
    }
    
    
}

class FloorModel: Mappable {
    var floorBgColor: String?
    var floorBgImg: String?
    var floorBottomMargin: Int?
    var floorName: String?
    var floorSort: Int?
    var floorTemplateName: String?
    var floorTemplateRoomLimit: Int?
    var rooms: [RoomModel]?
    var title : String?
    
    
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        floorBgColor <- map["floorBgColor"]
        floorBgImg <- map["floorBgImg"]
        floorBottomMargin <- map["floorBottomMargin"]
        floorName <- map["floorName"]
        floorSort <- map["floorSort"]
        floorTemplateName <- map["floorTemplateName"]
//     print("floorBgColor,floorBgImg,floorBottomMargin,floorName,floorSort,floorTemplateName",floorBgColor,floorBgImg,floorBottomMargin,floorName,floorSort,floorTemplateName)
        rooms <- map["rooms"]
    }
}

class RoomModel: Mappable {
    var action: String?
    var headImg: String?
    var needLogin: Bool?
    var marketPrice: String!
    var ourPrice: Double?
    var productImageUrl: String?
    var productName: String?
    var productStatusType: Int?
    var purchasePrice: Double?
    var title : String?
    var introduction : String?
    
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        action <- map["action"]
        headImg <- map["headImg"]
        needLogin <- map["needLogin"]
        marketPrice <- map["marketPrice"]
        ourPrice <- map["ourPrice"]
        productImageUrl <- map["productImageUrl"]
        productName <- map["productName"]
        productStatusType <- map["productStatusType"]
        purchasePrice <- map["purchasePrice"]
        title <- map["title"]
        introduction <- map["introduction"]
        print("action",action ?? "没有值")
    }
}
