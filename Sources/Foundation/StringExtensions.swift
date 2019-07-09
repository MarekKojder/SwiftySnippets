//
//  StringExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09/07/2019.
//

import UIKit

public extension String {

    var attributed: NSAttributedString {
        return NSAttributedString(string: self)
    }

    //TODO: To improve
    var attributedStringFromHtml: NSAttributedString {
        do {
            if let data = data(using: .unicode, allowLossyConversion: true) {
                return try NSAttributedString(data: data,
                                              options: [.documentType: NSAttributedString.DocumentType.html,
                                                        .characterEncoding: String.Encoding.unicode.rawValue],
                                              documentAttributes: nil)
            } else {
                print("Cannot parse string to data!")
            }
        } catch {
            print("Cannot parse HTML string: \(error.localizedDescription)")
        }
        return attributed
    }
}

public extension String {
    
    var capitalizingFirstLetter: String {
        return prefix(1).uppercased() + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter
    }

    var trimmingWhitespaces: String {
        return replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
    }

    mutating func trimWhitespaces() {
        self = self.trimmingWhitespaces
    }

    func bolding(substring: String, normalFont: UIFont, boldFont: UIFont) -> NSAttributedString {
        let range = NSString(string: self).range(of: substring, options: .caseInsensitive)
        guard range.location != NSNotFound else {
            return NSAttributedString(string: self)
        }
        let normalAttributes: [NSAttributedString.Key: Any] = [.font: normalFont]
        let boldAttributes: [NSAttributedString.Key: Any] = [.font: boldFont]
        let attributedAddress = NSMutableAttributedString(string: self, attributes: normalAttributes)
        attributedAddress.addAttributes(boldAttributes, range: range)
        return attributedAddress
    }

    func width(font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: fontAttributes)
        return size.width
    }
}

public extension NSAttributedString {

    var strikethrough: NSAttributedString {
        let mutable = NSMutableAttributedString(attributedString: self)
        mutable.addAttribute(.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.single.rawValue), range: NSMakeRange(0, mutable.length))
        mutable.addAttribute(.strikethroughColor, value: UIColor.gray, range: NSMakeRange(0, mutable.length))
        return mutable
    }

    var withoutStrikethrough: NSAttributedString {
        let mutable = NSMutableAttributedString(attributedString: self)
        mutable.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, mutable.length))
        mutable.removeAttribute(.strikethroughColor, range: NSMakeRange(0, mutable.length))
        return mutable
    }

    func appending(_ string: NSAttributedString) -> NSAttributedString {
        let mutable = NSMutableAttributedString(attributedString: self)
        mutable.append(string)
        return mutable
    }

    func with(_ font: UIFont) -> NSAttributedString {
        let newString = NSMutableAttributedString(attributedString: self)
        newString.enumerateAttribute(.font, in: NSMakeRange(0, newString.length), options: []) { value, range, stop in
            newString.addAttribute(.font, value: font, range: range)
        }
        return newString
    }

    func with(_ color: UIColor) -> NSAttributedString {
        let newString = NSMutableAttributedString(attributedString: self)
        newString.enumerateAttribute(.foregroundColor, in: NSMakeRange(0, newString.length), options: []) { value, range, stop in
            newString.addAttribute(.foregroundColor, value: color, range: range)
        }
        return newString
    }
}
