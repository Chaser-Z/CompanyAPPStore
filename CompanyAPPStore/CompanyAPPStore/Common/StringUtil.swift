//
//  StringUtil.swift
//  PandaHanzi
//
//  Created by 张海南 on 2018/3/2.
//  Copyright © 2018年 Beijing Han-sky Education Technology Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

class StringUtil {

    class func attributeString(fromString string: String, lineSpacing: CGFloat, fontSize: CGFloat) -> NSMutableAttributedString {
        return attributeString(fromString: string, alignment: .justified, lineSpacing: lineSpacing, fontSize: fontSize, fontWeight: .regular)
    }

    class func attributeString(fromString string: String, lineSpacing: CGFloat, font: UIFont) -> NSMutableAttributedString {
        return attributeString(fromString: string, alignment: .justified, lineSpacing: lineSpacing, font: font)
    }

    class func attributeString(fromString string: String, alignment: NSTextAlignment, lineSpacing: CGFloat, fontSize: CGFloat, fontWeight: UIFont.Weight = .light, textColor: UIColor = .black) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: string)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = alignment
        paragraphStyle.lineBreakMode = .byTruncatingTail
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, string.count))

        let font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        attributedString.addAttribute(NSAttributedStringKey.font, value: font, range: NSMakeRange(0, string.count))
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: textColor, range: NSMakeRange(0, string.count))
        return attributedString
    }

    class func ranges(ofString string: NSString, subString: String) -> [NSRange] {
        var ranges = [NSRange]()

        var searchRange = NSMakeRange(0, string.length)
        while (searchRange.location < string.length) {
            searchRange.length = string.length - searchRange.location
            let foundRange = string.range(of: subString, options: .literal, range: searchRange)

            if foundRange.location != NSNotFound {
                searchRange.location = foundRange.location + foundRange.length
            } else {
                break
            }

            ranges.append(foundRange)
        }

        return ranges
    }

    class func attributeString(fromString string: String, alignment: NSTextAlignment, lineSpacing: CGFloat, font: UIFont) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: string)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = alignment
        paragraphStyle.lineBreakMode = .byTruncatingTail
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, string.count))

        attributedString.addAttribute(NSAttributedStringKey.font, value: font, range: NSMakeRange(0, string.count))
        return attributedString
    }

    class func attributeString(fromString string: String?, subString: String?, color: UIColor) -> NSMutableAttributedString {
        if let string = string, let subString = subString {
            let myMutableString = NSMutableAttributedString(string: string)
            let subRanges = ranges(ofString: string as NSString, subString: subString)
            for range in subRanges {
                myMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
            }
            return myMutableString
        }
        return NSMutableAttributedString()
    }

    class func attributeString(fromString string: String?, subString: String?, color: UIColor, alignment: NSTextAlignment, lineSpacing: CGFloat, font: UIFont) -> NSMutableAttributedString {
        if let string = string, let subString = subString {
            let myMutableString = NSMutableAttributedString(string: string)
            let subRanges = ranges(ofString: string as NSString, subString: subString)
            for range in subRanges {
                myMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
            }
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            paragraphStyle.alignment = alignment
            paragraphStyle.lineBreakMode = .byTruncatingTail
            myMutableString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, string.count))

            myMutableString.addAttribute(NSAttributedStringKey.font, value: font, range: NSMakeRange(0, string.count))
            return myMutableString
        }

        return NSMutableAttributedString()
    }

}
