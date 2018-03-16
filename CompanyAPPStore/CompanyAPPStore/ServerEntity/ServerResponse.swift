//
//  ServerResponse.swift
//  PandaRead
//
//  Created by 张海南 on 2018/1/18.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import Foundation

class ServerResponse {
    
    
    var isSuccess: Bool
    var errorCode: Int
    
    var json: [String: Any]?
    var data: Data?
    var pdfPath: String?
    
    init(isSuccess: Bool, errorCode: Int, json: [String: Any]?) {
        self.isSuccess = isSuccess
        self.errorCode = errorCode
        self.json = json
    }
    
    
    init(isSuccess: Bool, errorCode: Int, data: Data?) {
        self.isSuccess = isSuccess
        self.errorCode = errorCode
        self.data = data
    }
    
    init(isSuccess: Bool, errorCode: Int, pdfPath: String?) {
        self.isSuccess = isSuccess
        self.errorCode = errorCode
        self.pdfPath = pdfPath
    }
    
    init(isSuccess: Bool, errorCode: Int) {
        self.isSuccess = isSuccess
        self.errorCode = errorCode
    }
    
    
}
