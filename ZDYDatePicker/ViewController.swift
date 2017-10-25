//
//  ViewController.swift
//  ZDYDatePicker
//
//  Created by 云中科技 on 2017/10/25.
//  Copyright © 2017年 云中科技. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var datePicker = ZDYDatePicker();
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.datePicker.frame = self.view.bounds;
        self.view.addSubview(self.datePicker);
        
        self.datePicker.sucessReturnB = { returnValue in
            
            print("=================",returnValue);
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

