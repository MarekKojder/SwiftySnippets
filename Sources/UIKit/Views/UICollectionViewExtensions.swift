//
//  UICollectionViewExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

//#if canImport(UICollectionView)
import UIKit.UICollectionView

///Class introducing `reuseIdentifier` needed for easy to use dequeueing reusable cell.
open class BaseCollectionViewCell: UICollectionViewCell {

    ///A string identifying the cell object to be reused. By default is equal type name.
    class var reuseIdentifier: String {
        return typeName
    }
}

public extension UICollectionView {

    /**
     Register a class for use in creating new collection view cells.

     - Parameters:
       - type: The class of a cell that you want to use in the table (must be a BaseCollectionViewCell subclass).
     */
    func register<T: BaseCollectionViewCell>(class type: T.Type) {
        register(type, forCellWithReuseIdentifier: type.reuseIdentifier)
    }

    /**
     Register a nib file for use in creating new collection view cells.

     - Parameters:
       - type: The class of a cell that you want to use in the table (must be a BaseCollectionViewCell subclass and attached to nib file).
     */
    func register<T: BaseCollectionViewCell>(nib type: T.Type) {
        let nibName = type.typeName
        register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: type.reuseIdentifier)
    }

    /**
     Returns a reusable cell object located by its identifier.

     - Parameters:
       - type: The class of a cell object to be reused (must be a BaseCollectionViewCell subclass).
       - indexPath: The index path specifying the location of the cell.
     */
    func dequeueReusable<T: BaseCollectionViewCell>(cell type: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as? T
    }
}
//#endif
