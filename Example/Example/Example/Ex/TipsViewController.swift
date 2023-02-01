//
//  TipsViewController.swift
//  Example
//
//  Created by darvin on 2023/2/1.
//  Copyright © 2023 cn.tcoding.dvt. All rights reserved.
//

import UIKit

#if canImport(DVTUIKit)
    import DVTUIKit
#endif

#if canImport(DVTUIKitTips)
    import DVTUIKitTips
#endif

class TipsViewController: EViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "提示"
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DVTTipsView(view: UIActivityIndicatorView(style: .large)).show(superview: self.view)
    }
}
