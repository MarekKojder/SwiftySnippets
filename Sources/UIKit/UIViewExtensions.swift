//
//  UIViewExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import UIKit

public extension UIView {
    
    class func loadFromNib<T: UIView>(owner: Any? = nil) -> T? {
        let nibName = typeName

        guard let view = Bundle.main.loadNibNamed(nibName, owner: owner, options: nil)?.first as? T else {
            return nil
        }
        return view
    }

    func show(on view: UIView, animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.executeOnMainThreadIfNeeded {
            guard animated else {
                view.addSubview(self)
                completion?()
                return
            }
            self.alpha = 0.0
            view.addSubview(self)
            UIView.animate(withDuration: 0.25, animations: {
                self.alpha = 1.0
            }, completion: { _ in
                completion?()
            })
        }
    }

    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.executeOnMainThreadIfNeeded {
            guard animated else {
                self.removeFromSuperview()
                completion?()
                return
            }
            UIView.animate(withDuration: 0.25, animations: {
                self.alpha = 0.0
            }, completion: { (_) in
                self.removeFromSuperview()
                completion?()
            })
        }
    }

    func set(hidden: Bool, animated: Bool) {
        guard self.isHidden != hidden else {
            return
        }
        DispatchQueue.executeOnMainThreadIfNeeded {
            guard animated else {
                self.isHidden = hidden
                return
            }
            UIView.animate(withDuration: 0.4) {
                self.isHidden = hidden
            }
        }
    }
}

public extension UIView {

    func rotate(cycleDuration: Double = 1.0) {
        let rotation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        rotation.valueFunction = CAValueFunction(name: .rotateZ)
        rotation.duration = cycleDuration
        rotation.fromValue = Float(0)
        rotation.toValue = Float.pi * 2
        rotation.repeatCount = Float.greatestFiniteMagnitude
        layer.add(rotation, forKey: "rotationAnimation")
    }
}

//MARK: - Corners and border
internal extension UIView {

    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
    }
}

