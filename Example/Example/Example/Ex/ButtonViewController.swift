//
//  ButtonViewController.swift
//  Example
//
//  Created by darvin on 2022/9/2.
//  Copyright © 2022 cn.tcoding.dvt. All rights reserved.
//

import DVTFoundation
import SnapKit
import UIKit

#if canImport(DVTUIKitExtension)
    import DVTUIKitExtension
#endif

#if canImport(DVTUIKitButton)
    import DVTUIKitButton
#elseif canImport(DVTUIKit)
    import DVTUIKit
#endif

class ButtonViewController: EViewController {
    lazy var btn: DVTUIButton = {
        let btn = DVTUIButton(type: .custom)
        btn.backgroundColor = .red
        btn.titleLabel?.numberOfLines = 0
        btn.setTitle("按钮2\n按钮10", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.setImage(UIImage(named: "scan_focus"), for: .normal)
        btn.spacing = 10
        return btn
    }()

    var timer: GCDTimer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "按扭"
        self.view.addSubview(self.btn)
        self.btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

//        self.btn.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }

        self.btn.bounds = CGRect(x: 0, y: 0, width: 120, height: 100)
        self.btn.center = self.view.center

        self.timer = GCDTimer(queue: .main, deadline: .now(), repeating: 3, auto: true) {
            self.btn.position = DVTUIButton.ImagePosition(rawValue: self.btn.position.rawValue + 1 % 4) ?? .right
        }
    }
}
