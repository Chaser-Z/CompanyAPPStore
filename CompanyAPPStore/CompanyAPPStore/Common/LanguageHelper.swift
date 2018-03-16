//
//  LanguageHelper.swift
//  PandaHanzi
//
//  Created by 张海南 on 2018/3/5.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import Foundation

let UserLanguage = "UserLanguage"
let AppleLanguages = "AppleLanguages"

let LangZhHans = "zh-Hans"
let LangEn = "en"
let LangEs = "es"

class LanguageHelper {

    static let shareInstance = LanguageHelper()
    let def = UserDefaults.standard
    var bundle: Bundle?

    fileprivate class func getString(key: String) -> String {
        let bundle = LanguageHelper.shareInstance.bundle
        let str = bundle?.localizedString(forKey: key, value: nil, table: nil)
        return str ?? ""
    }

    func initUserLanguage() {
        let language = def.value(forKey: UserLanguage) as? String ?? getPreferredLang()
        def.set(language, forKey: UserLanguage)
        def.synchronize()

        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        bundle = Bundle(path: path!)
    }

    func isCn() -> Bool {
        let string = def.value(forKey: UserLanguage) as? String ?? getPreferredLang()
        if string == LangZhHans {
            return true
        }

        return false
    }

    func currentLang() -> String {
        return def.value(forKey: UserLanguage) as? String ?? getPreferredLang()
    }

    func setLanguage(langeuage: String) {
        let path = Bundle.main.path(forResource: langeuage, ofType: "lproj")
        bundle = Bundle(path: path!)
        def.set(langeuage, forKey: UserLanguage)
        def.synchronize()
    }

    private func getPreferredLang() -> String {
        var preferred = NSLocale.preferredLanguages.first ?? LangEn
        if preferred.hasPrefix(LangZhHans) {
            preferred = LangZhHans
        } else if preferred.hasPrefix(LangEn) {
            preferred = LangEn
        } else if preferred.hasPrefix(LangEs) {
            preferred = LangEs
        } else {
            preferred = LangEn
        }

        return preferred
    }
}

// MARK: - Localized Trans Keys

func localized(_ key: String?) -> String {
    guard let key = key else {
        return ""
    }

    return LanguageHelper.getString(key: key)
}
