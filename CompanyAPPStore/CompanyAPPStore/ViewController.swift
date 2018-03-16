//
//  ViewController.swift
//  CompanyAPPStore
//
//  Created by 张海南 on 2018/3/13.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var list: [APPList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        APPListFacade.getAPPList { (list) in
            self.list = list
            
            for tt in self.list {
                CPLog(tt.app_name)
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

