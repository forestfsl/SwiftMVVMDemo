//
//  SegmentView.swift
//  PandaShop
//
//  Created by songlin on 10/12/2017.
//  Copyright © 2017 songlin. All rights reserved.
//

import Foundation
import UIKit


protocol SegmentViewDelegate : NSObjectProtocol {
    //点击方法
    func didSelectItemAtIndex(index:NSInteger)
}

class SegmentView: BaseView {
    //MARK: - 声明属性
    fileprivate var btnArray:[UIButton] = [UIButton]()
    fileprivate var bottomLine:UIView = UIView()
    fileprivate var scrollView:UIScrollView!
    fileprivate var currentBtn:UIButton!
    
    //默认是红色
    var themeColor:UIColor? {
        didSet{
            for btn in btnArray {
                btn.setTitleColor(themeColor, for: .selected)
                bottomLine.backgroundColor = themeColor
            }
        }
    }
    
    weak var delegate:SegmentViewDelegate?
    
    //MARK:设置标题数组
    var titleArray : [String]? {
        didSet {
            configLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 46)
        scrollView.backgroundColor = UIColor.clear
        scrollView.showsVerticalScrollIndicator = false
        self.addSubview(scrollView)
        themeColor = UIColor.red
    }
  
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override var frame: CGRect{
        didSet {
//            let vFrame =  CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: 46)
            super.frame = frame
            
        }
    }
    
    
    //MARK：配置布局
    private func configLayout() {
        //设置标题按钮
        let widthArray = getItemWidth()
        
        guard widthArray.count > 0 else {
            return
        }
        
        var buttonX:CGFloat = 0.0
        for i in 0..<widthArray.count {
            let button = UIButton(type:.custom)
            button.setTitle(titleArray?[i], for: .normal)
            button.tag = i + 100
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitleColor(themeColor, for: .selected)
            button.frame = CGRect(x:buttonX,y:0,width:widthArray[i]+20,height:44)
            button.addTarget(self, action: #selector(itemClick(btn:)), for: .touchUpInside)
            btnArray.append(button)
            buttonX += button.frame.width
            if i==0 {
                currentBtn =  button
                button.isSelected = true
            }
            
            scrollView.contentSize = CGSize(width: buttonX, height: 44)
            //设置下划线
            bottomLine.backgroundColor = themeColor
            bottomLine.frame = CGRect(x: currentBtn.frame.origin.x, y: currentBtn.frame.height, width: currentBtn.frame.width, height: 2)
            scrollView.addSubview(bottomLine)
        }
        
        
    }
    
    //MARK:获取标题宽度
    private func getItemWidth() ->[CGFloat] {
        var widthArray = [CGFloat]()
        let maxSize = CGSize(width:bounds.width,height:CGFloat(MAXFLOAT))
        for value in titleArray! {
            let str = value as NSString
            let contentSize = str.boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16)], context: nil).size
            let itemWidth = contentSize.width
            widthArray.append(itemWidth)
        }
        return widthArray
    }
    
    @objc func itemClick(btn:UIButton) {
        currentBtn?.isSelected = !((currentBtn?.isSelected)!)
        btn.isSelected = true
        currentBtn = btn
        //设置scrollView的偏移量
        setScrollViewOffset()
        //设置下划线位置
        setBottomLineOffset()
        
        //调用代理方法?判断已经代理了responsed
        delegate?.didSelectItemAtIndex(index: currentBtn.tag - 100)
    }
     //MARK:设置偏移
    private func setScrollViewOffset() {
        var offsetX = currentBtn.center.x - scrollView.frame.width * 0.5
        if offsetX<=0 {
            offsetX = 0
        }
        let maxOffsetX = scrollView.contentSize.width - scrollView.frame.width
        if offsetX>maxOffsetX {
            offsetX = maxOffsetX
        }
        scrollView.setContentOffset(CGPoint.init(x: offsetX, y: 0), animated: true)
        
    }
    
    //MARK:设置下划线便宜
    private func setBottomLineOffset() {
        UIView.animate(withDuration: 0.38) {
            self.bottomLine.frame = CGRect(x:self.currentBtn.frame.origin.x,y:self.currentBtn.frame.height,width:self.currentBtn.frame.width,height:2)
        }
    }
}
