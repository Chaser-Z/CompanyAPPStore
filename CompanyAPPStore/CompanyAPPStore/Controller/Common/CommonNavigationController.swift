//
//  CommonNavigationController.swift
//  CompanyAPPStore
//
//  Created by 张海南 on 2018/3/14.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import UIKit

class CommonNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.isTranslucent = true
        self.navigationBar.barStyle = .black
        self.navigationBar.barTintColor = UIColor.purple
        self.navigationBar.tintColor = .white
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

}

extension UIViewController {
    
    var contentViewController: UIViewController? {
        if let controller = self as? UINavigationController {
            return controller.topViewController
        }
        
        return self
    }
}
