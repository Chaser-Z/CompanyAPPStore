//
//  ServiceResponse.swift
//  PandaHanzi
//
//  Created by 张海南 on 2018/3/9.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import Foundation

class ServiceResponse {
    
    var isSuccess: Bool
    var errorCode: Int
    var dict: [String: Any] = [:]
    var data: Data?
    var pdfPath: String?
    
    init(isSuccess: Bool, errorCode: Int) {
        self.isSuccess = isSuccess
        self.errorCode = errorCode
    }
    
}
