//
//  APPListFacade.swift
//  CompanyAPPStore
//
//  Created by 张海南 on 2018/3/13.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import Foundation

class APPListFacade {
    
    class func getAPPList(completion: @escaping (_ list: [APPList]) -> Void) {
        
        APPListWSHelper.getAPPList([:]) { resp in
            let code = resp.errorCode
            if code == ErrorCode.Success {
                let serverList = resp.dict["list"] as! [ServerAPPList]
                let apps = serverList.map {
                    APPListManager.add($0)
                }
            
                completion(apps as! [APPList])
                
            } else {
                CPLog("Failed to get all applist: \(code)")
                completion([])
            }
        }
        
    }
    
}
