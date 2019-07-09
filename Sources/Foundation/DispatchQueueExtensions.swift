//
//  DispatchQueueExtensions.swift
//  SwiftySnippets
//
//  Created by Marek Kojder on 09/07/2019.
//

import Foundation

public extension DispatchQueue {
    /**
     Method switches to main thread only when is executing on other thread.

     - Parameter work: Block to execute on main thread.

     You can use that method to avoid unnecesarry switching to main thread.
     */
    class func executeOnMainThreadIfNeeded(_ work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            main.async(execute: work)
        }
    }
}
