//
//  UIImageView+Ext.swift
//  JianKeSwift
//
//  Created by songlin on 24/10/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    //创建imageView
    //parameter imageName: 图片名字
    //returns:
    
    convenience init(imgName: String) {
        self.init(image: UIImage(named:imgName))
    }
    
    
    //parameter withUrlString: 图片的urlString
    //parameter placeholderImgName: 默认图片的名字
    func SL_setImage(withUrlString: String?,placeholderImgName:String?) {
        //获取图片的url
        let url = URL(string:withUrlString ?? "")
        //判断是否为nil
        guard let u = url else {
            return
        }
        self.kf.setImage(with: u, placeholder: UIImage(named:placeholderImgName ?? ""), options: nil, progressBlock: nil, completionHandler: nil)
        
    }
    
    
//    func setImageWithUrl(_ url: String,_ placeholder: String?) -> Void {
//        var placeholderImg: UIImage?
//        if placeholder == nil {
//            placeholderImg = nil
//        }else {
//            placeholderImg = UIImage.init(named:placeholder!)
//        }
//        self.sd_setImage(with: URL.init(string: url), placeholderImage: placeholderImg)
//    }
//
//    func setImageWithUrl(_ url: String) {
//        self.sd_setImage(with: URL.init(string: url))
//    }
//
//    func setImageWithUrl(_ url: String,_ placeholder:String?,completionHandler: @escaping completionHandler) ->Void {
//        var placeholderImg: UIImage?
//        if placeholder == nil {
//            placeholderImg = nil
//        }else {
//            placeholderImg = UIImage.init(named: placeholder!)
//        }
//
//        self.sd_setImage(with: URL.init(string: url), placeholderImage: placeholderImg, options: SDWebImageOptions.retryFailed, progress: {
//            (_,_,_) in
//
//        }, completed: {
//            (image,error,_,imgUrl) in
//            completionHandler(image,error,imgUrl)
//        })
//    }
}
