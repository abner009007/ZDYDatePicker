//
//  LYJDatePicker01.swift
//  MyswiftDemo
//
//  Created by Liyanjun on 2017/2/8.
//  Copyright © 2017年 Liyanjun. All rights reserved.
//

import UIKit

// 屏幕的宽
let screen_WIDTH = UIScreen.main.bounds.size.width
// 屏幕的高
let screen_HEIGHT = UIScreen.main.bounds.size.height
//主色
let systemBaseColor = UIColor.init(red: 255/255, green: 127/255, blue: 228/255, alpha: 1.0);
//背景色
let systemBackgroundColor = UIColor.groupTableViewBackground;
//项目中基本字体的大小
let systemBaseFont = UIFont.systemFont(ofSize: 14);


class ZDYDatePicker: UIView {

    
    var sucessReturnB: ((_ date:String) -> Void)?//选择的回调
    
    var title = UILabel.init(lableText: "选择时间")//标
    var cancelButton = UIButton.init(title: "取消", bgColor: UIColor.clear, font:  CGFloat(15)) //取消按钮
    var confirmButton = UIButton.init(title: "确定", bgColor: UIColor.clear, font:  CGFloat(15)) //取消按钮
    
    var backgrouend = UIView()//
    var backgrouendViewBlack = UIView()//
    var lineView = UIView()//一条横线
    var dateFormatter = DateFormatter()
    var datePicker = UIDatePicker()
    
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.cancelButton.frame = CGRect(x:0,y:5,width:40,height:30);
        self.confirmButton.frame = CGRect(x:screen_WIDTH-40,y:5,width:40,height:30);
        self.title.frame = CGRect(x:40,y:10,width:screen_WIDTH-80,height:20);
        self.lineView.frame = CGRect(x:0,y:39,width:screen_WIDTH,height:1);
        self.datePicker.frame = CGRect(x:0,y:40,width:screen_WIDTH,height:216);
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    func setupUI() {
        
        self.backgroundColor = UIColor.clear;
        
        self.backgrouendViewBlack.frame = CGRect(x:0,y:0,width:screen_WIDTH,height:screen_HEIGHT);
        self.backgrouendViewBlack.backgroundColor = UIColor.black;
        self.backgrouendViewBlack.alpha = 0.5;
        self.addSubview(self.backgrouendViewBlack);
        
        self.backgrouend = UIView.init(frame: CGRect(x:0,y:screen_HEIGHT-256,width:screen_WIDTH,height:256));
        self.backgrouend.backgroundColor = UIColor.white;
        self.addSubview(self.backgrouend);
        
        
        self.title.textColor = systemBaseColor
        self.title.textAlignment = .center
        self.title.font = systemBaseFont
        self.title.text = "请选择时间";
        self.backgrouend.addSubview(self.title)
        
        
        self.cancelButton.setTitleColor(UIColor.black, for: .normal)
        self.cancelButton.tag = 101
        self.cancelButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        self.backgrouend.addSubview(self.cancelButton)
        
        
        
        self.lineView.backgroundColor = systemBackgroundColor
        self.backgrouend.addSubview(self.lineView)
        
        
        self.confirmButton.setTitleColor(UIColor.black, for: .normal)
        self.confirmButton.tag = 102
        self.confirmButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        self.backgrouend.addSubview(self.confirmButton)
        
        
        
        self.dateFormatter.dateFormat = "yyyy-MM-dd"
        self.datePicker.datePickerMode = .date
        self.datePicker.locale = Locale(identifier: "zh_CN")
        self.backgrouend.addSubview(self.datePicker)
    }

    
    //MARK:按钮的点击
    func buttonClick(_ sender:UIButton) {
        
        
        
        switch sender.tag {
        case 101:
            self.removeFromSuperview();
        case 102:
            //确定
            if self.sucessReturnB != nil {
                
                let currentDate = datePicker.date
                
                let dateStr = dateFormatter.string(from: currentDate)
                self.sucessReturnB!(dateStr)
                self.removeFromSuperview();
            }
            
            
        default:
            break
        }
    }
    
}

