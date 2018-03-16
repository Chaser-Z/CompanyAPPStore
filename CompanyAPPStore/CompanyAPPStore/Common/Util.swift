//
//  Util.swift
//  PandaHanzi
//
//  Created by Michael Qu on 03/03/2018.
//  Copyright © 2018 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import Foundation
import MBProgressHUD

// MARK: - Common Functions

func CPLog<T>(_ message: T, file: String = #file, funcName: String = #function, lineNum: Int = #line) {
#if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("\(fileName):(\(lineNum))-\(message)")
#endif
}


public func isX() -> Bool {
    if UIScreen.main.bounds.height == 812 {
        return true
    }

    return false
}

// MARK: - Show HUD
func showHUD(_ message: String? = nil, mode: MBProgressHUDMode = .indeterminate, onView view: UIView?) ->  MBProgressHUD? {
    if let view = view {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = mode
        if let text = message {
            hud.label.text = text
        }
        hud.removeFromSuperViewOnHide = true
        return hud
    }
    return nil
}

func showHUDNoView(_ message: String? = nil, mode: MBProgressHUDMode = .indeterminate) ->  MBProgressHUD? {
    if let delegate = UIApplication.shared.delegate as? AppDelegate {
        if let window = delegate.window {
            let hud = MBProgressHUD.showAdded(to: window, animated: true)
            hud.mode = mode
            if let text = message {
                hud.label.text = text
            }
            hud.removeFromSuperViewOnHide = true
            return hud
        }
    }
    return nil
}

func showMessage(_ message: String, errorCode: Int? = nil, onView view: UIView?) {
    if let view = view {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        
        if let code = errorCode {
            let text = "\(message)：\(code)"
            hud.detailsLabel.text = text
        } else {
            hud.detailsLabel.text = message
        }
        
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 1.2)
    }
}


func showHUD(_ message: String? = nil) {
    guard let message = message else {
        return
    }
    
    if let delegate = UIApplication.shared.delegate as? AppDelegate {
        if let window = delegate.window {
            let hud = MBProgressHUD.showAdded(to: window, animated: true)
            hud.removeFromSuperViewOnHide = true
            hud.mode = .text
            hud.hide(animated: true, afterDelay: 1.5)
            hud.detailsLabel.text = message
        }
    }
}
