//
//  KeyboardViewController.swift
//  Example
//
//  Created by darvin on 2022/11/29.
//  Copyright © 2022 cn.tcoding.dvt. All rights reserved.
//

import UIKit
#if canImport(DVTUIKitPublic)
    import DVTUIKitPublic
#endif
#if canImport(DVTUIKitTips)
    import DVTUIKitTips
#endif

class KeyboardViewController: UIViewController {
    lazy var inputBoxView: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 54))
        textField.center = CGPoint(x: .dvt.screenWidth / 2, y: .dvt.navigationBarHeight + 80)
        textField.placeholder = "请输入"
        textField.borderStyle = .roundedRect
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "车牌键盘"
        self.view.backgroundColor = .white
        self.view.addSubview(self.inputBoxView)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.inputBoxView.endEditing(true)
        DVTTipsView(view: UIActivityIndicatorView(style: .large)).show(superview: self.view)
    }

    deinit {
        print(self)
    }
}
