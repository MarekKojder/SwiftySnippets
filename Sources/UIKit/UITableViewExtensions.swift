//
//  UITableViewExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import UIKit

open class BaseTableViewCell: UITableViewCell {

    class var reuseIdentifier: String {
        return typeName
    }

    func hideSeparator() {
        separatorInset = UIEdgeInsets(top: 0, left: frame.size.width * 2, bottom: 0, right: 0)
    }
}

public extension UITableView {

    func register<T: BaseTableViewCell>(class type: T.Type) {
        register(type, forCellReuseIdentifier: type.reuseIdentifier)
    }

    func register<T: BaseTableViewCell>(nib type: T.Type) {
        let nibName = type.typeName
        register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: type.reuseIdentifier)
    }

    func dequeueReusable<T: BaseTableViewCell>(cell type: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? T
    }

    func dequeueReusable<T: BaseTableViewCell>(cell type: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: type.reuseIdentifier) as? T
    }
}
