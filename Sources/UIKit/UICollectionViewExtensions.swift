//
//  UICollectionViewExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import UIKit

open class BaseCollectionViewCell: UICollectionViewCell {

    class var reuseIdentifier: String {
        return typeName
    }
}

public extension UICollectionView {

    func dequeueReusable<T: BaseCollectionViewCell>(cell type: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as? T
    }
}
