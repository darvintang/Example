//
//  ENavigationController.swift
//  Example
//
//  Created by darvin on 2022/8/8.
//

#if canImport(DVTUIKit_Navigation)
    import DVTUIKit_Navigation
#elseif canImport(DVTUIKit)
    import DVTUIKit_
#endif

import UIKit

class ENavigationController: DVTUINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
