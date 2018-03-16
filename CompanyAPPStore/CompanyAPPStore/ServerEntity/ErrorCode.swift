//
//  ErrorCode.swift
//  PandaHanzi
//
//  Created by 张海南 on 2018/3/9.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import Foundation


struct ErrorCode {
    
    // Success
    
    static let Success = 0
    
    // Fail
    
    static let ServerError = 2
    static let DatabaseError = 3
    static let InvalidSession = 4
    static let InvalidParams = 5
    static let NotImplemented = 6
    
    // Client Error Code
    
    static let ClientError = -100
    static let ClientNoDataReturned = -110
    static let ClientEncodingError = -120
    static let FileDownloadError = -130
    static let JSONEmptyError = -150
    static let JSONParsingError = -160
    static let JSONMissingErrorCode = -170
    
    // Resource Download Error Code
    
    static let ResDownloadError = -200
    static let ResIsDownloading = -201
    static let ResDownloadingExceedMax = -202
    static let ResNotFound = -203
    static let ResDownloadCancelled = -204
    
    // Server Error Code: User
    
    static let UserUnknownError = 201
    static let UserLoginnameCharError = 211
    static let UserLoginnameExisting = 212
    static let UserEmailExisting = 213
    static let UserLoginError = 214
    static let UserForgetPWDError = 215
    static let UserPasswordError = 216
    static let UserPhotoNotFound = 217
    static let UserPhotoExisting = 218
    static let UserPhoneChanged = 219
    static let IncorrectRandomCode = 220
    static let FailedToSendSMS = 221
    static let UserNotExist = 222
    static let UserRegisterError = 223
    static let UserRegisterLoginIlegal = 224
    static let UserRegisterPasswordIlegal = 225
    static let UserRegisterEmailIlegal = 226
    
    // File
    
    static let FileNotFound = 331
    
    // Error Messages
    
    public static var messageKeyDict = [
        Success:                    "成功",
        ServerError:                "未知错误",
        DatabaseError:              "数据库错误",
        InvalidSession:             "用户名或密码错误",
        InvalidParams:              "参数错误",
        NotImplemented:             "未执行",
        UserUnknownError:           "用户未知错误",
        UserLoginnameCharError:     "用户登录名错误",
        UserLoginnameExisting:      "用户登录名已存在",
        UserEmailExisting:          "用户邮箱已存在",
        UserLoginError:             "用户登录失败",
        UserForgetPWDError:         "用户找回密码失败",
        UserPasswordError:          "用户修改密码失败",
        UserPhotoNotFound:          "用户头像未找到",
        UserPhotoExisting:          "用户电话已存在",
        UserPhoneChanged:           "用户电话以改变",
        IncorrectRandomCode:        "随机码错误",
        FailedToSendSMS:            "短信发送失败",
        UserNotExist:               "用户不存在",
        UserRegisterError:          "用户注册失败",
        UserRegisterLoginIlegal:    "注册登录用户名不合法",
        UserRegisterPasswordIlegal: "注册登录密码不合法",
        UserRegisterEmailIlegal:    "注册邮箱不合法",
        FileNotFound:               "文件未找到"
    ]
}

func message(ofCode code: Int) -> String {
    if let messageKey = ErrorCode.messageKeyDict[code] {
        return localized(messageKey)
    } else {
        return "\(code)"
    }
}
