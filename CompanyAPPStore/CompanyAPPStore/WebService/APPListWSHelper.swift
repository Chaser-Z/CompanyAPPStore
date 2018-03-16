//
//  APPListWSHelper.swift
//  CompanyAPPStore
//
//  Created by 张海南 on 2018/3/10.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import Foundation

class APPListWSHelper {
    
    class func getAPPList(_ params: [String: AnyObject], completion: @escaping ServiceHandler) {
        let path = "/getAPPList"
        
        CommonWSHelper.request(path: path) { (resp) in
            let serviceResponse = CommonWSHelper.processServiceResponse(resp) { json in
                var info = [String: Any]()
                if let dict = json as? [String: Any] {
                    if let appListDict = dict["resultData"] as? [[String: Any]] {
                        let apps = appListDict.map {
                            ServerAPPList.fromDict($0)
                        }
                        info["list"] = apps
                    }
                }
                
                return info
            }
            completion(serviceResponse)
        }
        
//        CommonWSHelper.request(path: path, params: params) { resp in
//            let serviceResponse = CommonWSHelper.processServiceResponse(resp) { json in
//                var info = [String: Any]()
//                if let dict = json as? [String: Any] {
//                    if let resultDict = dict["resultData"] as? [[String: AnyObject]] {
//                        
//                    }
//                }
//                
//                return info
//            }
//            completion(serviceResponse)
//        }
    }
    
    
}
