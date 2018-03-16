//
//  APPListCell.swift
//  CompanyAPPStore
//
//  Created by 张海南 on 2018/3/14.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import UIKit
import SDWebImage
class APPListCell: UICollectionViewCell {
    
    @IBOutlet weak var appiconImageView: UIImageView!
    @IBOutlet weak var appnameLabel: UILabel!
    @IBOutlet weak var appversionLabel: UILabel!
    
    func setup(app: APPList) {
        
        let url = URL(string: "\(HOST)/\(app.app_icon!)")
        
        appiconImageView.sd_setImage(with: url, completed: nil)
        appnameLabel.text = app.app_name
        appversionLabel.text = app.app_version
    }
}
