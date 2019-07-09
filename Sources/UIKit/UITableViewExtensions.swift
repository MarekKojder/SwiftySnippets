//
//  UITableViewExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import UIKit

///Class introducing `reuseIdentifier` needed for easy to use dequeueing reusable cell.
open class BaseTableViewCell: UITableViewCell {

    ///A string identifying the cell object to be reused. By default is equal type name.
    class var reuseIdentifier: String {
        return typeName
    }
}

public extension BaseTableViewCell {

    ///Hides separator of cell by moving it outside of the screen.
    func hideSeparator() {
        separatorInset = UIEdgeInsets(top: 0, left: frame.size.width * 2, bottom: 0, right: 0)
    }
}

public extension UITableView {

    /**
     Registers a class for use in creating new table cells.

     - Parameters:
       - type: The class of a cell that you want to use in the table (must be a BaseTableViewCell subclass).
     */
    func register<T: BaseTableViewCell>(class type: T.Type) {
        register(type, forCellReuseIdentifier: type.reuseIdentifier)
    }

    /**
     Registers a nib object containing a cell with the table view under a specified identifier.

     - Parameters:
       - type: The class of a cell that you want to use in the table (must be a BaseTableViewCell subclass and attached to nib file).
     */
    func register<T: BaseTableViewCell>(nib type: T.Type) {
        let nibName = type.typeName
        register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: type.reuseIdentifier)
    }

    /**
     Returns a reusable table-view cell object for the specified class and adds it to the table.

     - Parameters:
       - type: The class of a cell object to be reused (must be a BaseTableViewCell subclass).
       - indexPath: The index path specifying the location of the cell.
     */
    func dequeueReusable<T: BaseTableViewCell>(cell type: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? T
    }

    /**
     Returns a reusable table-view cell object located by its identifier.

     - Parameters:
       - type: The class of a cell object to be reused (must be a BaseTableViewCell subclass).
     */
    func dequeueReusable<T: BaseTableViewCell>(cell type: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: type.reuseIdentifier) as? T
    }
}
