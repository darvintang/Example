//
//  ENavigationController.swift
//  Example
//
//  Created by darvin on 2022/8/8.
//

#if canImport(DVTUIKitNavigation)
    import DVTUIKitNavigation
#elseif canImport(DVTUIKit)
    import DVTUIKit
#endif

import UIKit

class ENavigationController: DVTUINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
