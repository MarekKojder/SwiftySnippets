//
//  BaseTableViewCellExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import UIKit

public extension BaseTableViewCell {

    ///Hides separator of cell by moving it outside of the screen.
    func hideSeparator() {
        separatorInset = UIEdgeInsets(top: 0, left: frame.size.width * 2, bottom: 0, right: 0)
    }
}
