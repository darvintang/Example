//
//  ButtonViewController.swift
//  Example
//
//  Created by darvin on 2022/9/2.
//  Copyright © 2022 cn.tcoding.dvt. All rights reserved.
//

import UIKit
import SnapKit
import DVTUIKit
import DVTFoundation

#if canImport(DVTUIKit_Extension)
    import DVTUIKit_Extension
#endif

#if canImport(DVTUIKit_Button)
    import DVTUIKit_Button
#endif

#if canImport(DVTUIKit_Label)
    import DVTUIKit_Label
#endif

#if canImport(DVTUIKit_Badge)
    import DVTUIKit_Badge
#endif

class ButtonViewController: EViewController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "按扭"
        self.view.addSubview(self.btn)

        self.btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 20)
        self.btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)

        self.btn.snp.makeConstraints { make in
            make.center.equalToSuperview()
//            make.height.equalTo(44)
//            make.width.equalTo(120)
        }
        self.btn.dvt.add { btn in
            btn.setImage(btn.dvt.image, for: .normal)
        }

//        self.btn.bounds = CGRect(x: 0, y: 0, width: 120, height: 100)
//        self.btn.center = self.view.center

//        self.timer = GCDTimer(queue: .main, deadline: .now(), repeating: 3, auto: true) {
//            self.btn.position = DVTUIButton.ImagePosition(rawValue: self.btn.position.rawValue + 1 % 4) ?? .right
//        }

        self.label.text = "测试"
        self.label.backgroundColor = .red
        self.label.highlightedBackgroundColor = .blue
        self.label.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.label.didCopyBlock = { _, string in
            eLoger.debug(string)
        }
        self.btn.addSubview(self.label)
        self.label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }
    }

    // MARK: Internal
    lazy var btn: DVTUIButton = {
        let btn = DVTUIButton(type: .custom)
        btn.backgroundColor = .red
        btn.position = .top
        btn.setTitle("按钮2按钮10", for: .normal)
//        btn.setTitle("", for: .highlighted)
        btn.setTitleColor(.black, for: .normal)
        btn.setImage(UIImage(named: "scan_focus"), for: .normal)
        btn.spacing = 10
        return btn
    }()

    let label = DVTUILabel()

    var timer: GCDTimer?

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.navigationItem.rightBarButtonItem != nil {
            print(self.navigationItem.rightBarButtonItem?.dvt.badgeNumber ?? 0)
            self.navigationItem.rightBarButtonItem?.dvt.badgeNumber = UInt.random(in: 1 ... 100) * 100
            return
        }
        if #available(iOS 14.0, *) {
            var item = UIBarButtonItem(title: "123")
            self.navigationItem.rightBarButtonItem = item
            item.dvt.badgeNumber = 1
//            item.dvt.badgeContentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 2, right: 4)
            print(item.dvt.badgeNumber)
        }
    }
}
