//
//  StringExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09/07/2019.
//

import UIKit

public extension String {

    ///Attributed version of string.
    var attributed: NSAttributedString {
        return NSAttributedString(string: self)
    }

    ///Creates attributed string from HTML formatted string.
    func attributedStringFromHtml() throws -> NSAttributedString  {
        guard let data = data(using: .unicode, allowLossyConversion: true) else {
            return attributed
        }
        return try NSAttributedString(data: data,
                                      options: [.documentType: NSAttributedString.DocumentType.html,
                                                .characterEncoding: String.Encoding.unicode.rawValue],
                                      documentAttributes: nil)
    }
}

public extension String {

    ///String with uppercased first letter.
    var capitalizingFirstLetter: String {
        return prefix(1).uppercased() + dropFirst()
    }

    ///Uppercases first letter of the string.
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter
    }

    ///String with trimmed whitespaces.
    var trimmingWhitespaces: String {
        return replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
    }

    ///Trimmes white spaces of the string.
    mutating func trimWhitespaces() {
        self = self.trimmingWhitespaces
    }

    /**
     Returns the bounding box size the receiver occupies when drawn with the given font.

     - Parameters:
       - font: Font which should be used when drawning text.

     - Returns: Bounding box size of text.
     */
    func size(with font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: fontAttributes)
        return size
    }

    /**
     Bolds given substring of the string.

     - Parameters:
       - substring: Substring to bold.
       - normalFont: Font for regular text.
       - boldFont: Font for bolded text.
       - options: An substring search options. For possible values, see NSString.CompareOptions.

     - Returns: NSAttributedString with bolded substring if exists.
     */
    func bolding(substring: String, normalFont: UIFont, boldFont: UIFont, options: NSString.CompareOptions = [.caseInsensitive]) -> NSAttributedString {
        let range = NSString(string: self).range(of: substring, options: options)
        guard range.location != NSNotFound else {
            return NSAttributedString(string: self)
        }
        let normalAttributes: [NSAttributedString.Key: Any] = [.font: normalFont]
        let boldAttributes: [NSAttributedString.Key: Any] = [.font: boldFont]
        let attributedAddress = NSMutableAttributedString(string: self, attributes: normalAttributes)
        attributedAddress.addAttributes(boldAttributes, range: range)
        return attributedAddress
    }
}

public extension NSAttributedString {

    ///Removes strikethrough from the text.
    var withoutStrikethrough: NSAttributedString {
        let mutable = NSMutableAttributedString(attributedString: self)
        mutable.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, mutable.length))
        mutable.removeAttribute(.strikethroughColor, range: NSMakeRange(0, mutable.length))
        return mutable
    }

    /**
     Returns strikethrough text.

     - Parameters:
       - color: Color which should bu used for striking through
     */
    func strikethrough(with color: UIColor = .gray) -> NSAttributedString {
        let mutable = NSMutableAttributedString(attributedString: self)
        mutable.addAttribute(.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.single.rawValue), range: NSMakeRange(0, mutable.length))
        mutable.addAttribute(.strikethroughColor, value: color, range: NSMakeRange(0, mutable.length))
        return mutable
    }

    /**
     Appends given text to the current string.

     - Parameters:
       - string: String to append

     - Returns: Current string with appended given one.
     */
    func appending(_ string: NSAttributedString) -> NSAttributedString {
        let mutable = NSMutableAttributedString(attributedString: self)
        mutable.append(string)
        return mutable
    }

    /**
     Returns current string in given font.

     - Parameters:
       - font: Font of the string.
     */
    func with(_ font: UIFont) -> NSAttributedString {
        let newString = NSMutableAttributedString(attributedString: self)
        newString.enumerateAttribute(.font, in: NSMakeRange(0, newString.length), options: []) { value, range, stop in
            newString.addAttribute(.font, value: font, range: range)
        }
        return newString
    }

    /**
     Returns current string in given color.

     - Parameters:
       - color: Color of the string.
     */
    func with(_ color: UIColor) -> NSAttributedString {
        let newString = NSMutableAttributedString(attributedString: self)
        newString.enumerateAttribute(.foregroundColor, in: NSMakeRange(0, newString.length), options: []) { value, range, stop in
            newString.addAttribute(.foregroundColor, value: color, range: range)
        }
        return newString
    }
}
