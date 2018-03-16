//
//  ServerAPPList.swift
//  CompanyAPPStore
//
//  Created by 张海南 on 2018/3/13.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import Foundation


class ServerAPPList {
    
    var id: Int64
    var app_id: String
    var app_name: String?
    var app_link: String?
    var app_version: String?
    var app_icon: String?
    
    init(id: Int64, app_id: String) {
        self.id = id
        self.app_id = app_id
    }
    
    
}

extension ServerAPPList {
    
    class func fromDict(_ dict: [String: Any]) -> ServerAPPList? {
        let id = dict["id"] as! Int64
        let app_id = dict["app_id"] as! String
        let appList = ServerAPPList(id: id, app_id: app_id)
        
        if let app_name = dict["app_name"] as? String {
            appList.app_name = app_name
        }
        
        if let app_link = dict["app_link"] as? String {
            appList.app_link = app_link
        }
        
        if let app_version = dict["app_version"] as? String {
            appList.app_version = app_version
        }
        
        if let app_icon = dict["app_icon"] as? String {
            appList.app_icon = app_icon
        }

        return appList
    }
}
