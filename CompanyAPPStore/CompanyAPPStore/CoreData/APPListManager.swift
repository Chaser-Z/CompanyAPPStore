//
//  APPListManager.swift
//  CompanyAPPStore
//
//  Created by 张海南 on 2018/3/13.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import Foundation
import CoreData


class APPListManager {
    
    private static let entityAPPList = "APPList"

    
    class func add(_ serverApp: ServerAPPList) -> APPList?{
        
        var apps: APPList? = nil
        
        let context = CoreDataStack.sharedInstance.context
        let request: NSFetchRequest<APPList> = APPList.fetchRequest()

        do {
            let applist = try context.fetch(request)
//            if applist.count > 0 {
//                //apps = applist.first
//            } else {
                let entity = NSEntityDescription.entity(forEntityName: entityAPPList, in: context)
                apps = APPList(entity: entity!, insertInto: context)
            //}
            setFields(list: apps!, serveList: serverApp)
            try context.save()
        } catch {
            CPLog("Failed to add Record, error: \(error)")
        }
        
        return apps
    }
    
    
    private class func setFields(list: APPList, serveList:ServerAPPList) {
        list.id = serveList.id
        list.app_id = serveList.app_id
        list.app_name = serveList.app_name
        list.app_link = serveList.app_link
        list.app_version = serveList.app_version
        list.app_icon = serveList.app_icon
    }
    
}

