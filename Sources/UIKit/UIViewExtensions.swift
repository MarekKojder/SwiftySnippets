//
//  UIViewExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09.07.2019.
//

import UIKit

//MARK: - Loading
public extension UIView {

    /**
     Unarchives the contents of a nib file associated with class.

     - Parameter owner: The object to assign as the nib’s File's Owner object.

     - Returns: Object loaded form nib file.
     */
    class func loadFromNib<T: UIView>(owner: Any? = nil) -> T? {
        let nibName = typeName

        guard let view = Bundle.main.loadNibNamed(nibName, owner: owner, options: nil)?.first as? T else {
            return nil
        }
        return view
    }
}

//MARK: - Adding and removing
public extension UIView {
    /**
     Adds subview with completion handler.

     - Parameters:
       - view: The view to be added. After being added, this view appears on top of any other subviews.
       - duration: The total duration of the animations, measured in seconds. If you specify a negative value or 0, view will appear without animation.
       - completion: Block of code to execute after finishing the operation.
     */
    func show(on view: UIView, withDuration duration: TimeInterval = 0.35, completion: (() -> Void)? = nil) {
        DispatchQueue.executeOnMainThreadIfNeeded {
            self.alpha = 0.0
            view.addSubview(self)
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 1.0
            }, completion: { _ in
                completion?()
            })
        }
    }

    /**
     Unlinks the view from its superview and its window, and removes it from the responder chain with completion handler.

     - Parameters:
       - duration: The total duration of the animations, measured in seconds. If you specify a negative value or 0, view will disappear without animation.
       - completion: Block of code to execute after finishing the operation.
     */
    func dismiss(withDuration duration: TimeInterval = 0.35, completion: (() -> Void)? = nil) {
        DispatchQueue.executeOnMainThreadIfNeeded {
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 0.0
            }, completion: { (_) in
                self.removeFromSuperview()
                completion?()
            })
        }
    }

    /**
     Hides the view with completion handler.

     - Parameters:
       - hidden: A Boolean value that determines whether the view should be hidden.
       - duration: The total duration of the animations, measured in seconds. If you specify a negative value or 0, view will disappear without animation.
       - completion: Block of code to execute after finishing the operation.
     */
    func set(hidden: Bool, withDuration duration: TimeInterval = 0.35, completion: (() -> Void)? = nil) {
        guard self.isHidden != hidden else {
            return
        }
        DispatchQueue.executeOnMainThreadIfNeeded {
            UIView.animate(withDuration: duration, animations: {
                self.isHidden = hidden
            }, completion: { (_) in
                completion?()
            })
        }
    }
}

//MARK: - Animating
public extension UIView {

    ///Key of foration animation.
    private var rotationAnimationKey: String {
        return "\(typeName).layer.rotationAnimation"
    }

    /**
     Rotates view around Z-axis.

     - Parameters:
       - cycleDuration: Specifies the duration of once cycle of the animation, in seconds.

     After calling this method view will rotate infinitely.
     */
    func rotate(cycleDuration: Double = 1.0) {
        let rotation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        rotation.valueFunction = CAValueFunction(name: .rotateZ)
        rotation.duration = cycleDuration
        rotation.fromValue = Float(0)
        rotation.toValue = Float.pi * 2
        rotation.repeatCount = Float.greatestFiniteMagnitude
        layer.add(rotation, forKey: rotationAnimationKey)
    }

    ///Stops rotating view around Z-axis.
    func stopRotating() {
        layer.removeAnimation(forKey: rotationAnimationKey)
    }
}

//MARK: - Corners and border
public extension UIView {

    ///The width of the layer’s border. Animatable.
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    ///The color of the layer’s border. Animatable.
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

    ///The radius to use when drawing rounded corners for the layer’s background. Animatable.
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

