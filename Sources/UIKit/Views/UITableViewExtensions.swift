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

    ///Workarount for not working autolayout in UITableview header.
    func layoutTableViewHeader() {
        guard let headerView = tableHeaderView else {
            return
        }
        headerView.translatesAutoresizingMaskIntoConstraints = false

        let headerWidth = headerView.bounds.size.width
        let temporaryWidthConstraint = NSLayoutConstraint(item: headerView, attribute: .width, relatedBy: .equal,
                                                          toItem: nil, attribute: .notAnAttribute,
                                                          multiplier: 1, constant: headerWidth)
        headerView.addConstraint(temporaryWidthConstraint)
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()

        let headerHeight = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        var frame = headerView.frame

        frame.size.height = headerHeight
        headerView.frame = frame

        tableHeaderView = headerView

        headerView.removeConstraint(temporaryWidthConstraint)
        headerView.translatesAutoresizingMaskIntoConstraints = true
    }
}
