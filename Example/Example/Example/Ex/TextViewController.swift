//
//  TextViewController.swift
//  Example
//
//  Created by darvin on 2023/2/23.
//  Copyright © 2023 cn.tcoding.dvt. All rights reserved.
//

import UIKit
import SnapKit

#if canImport(DVTUIKit_Pasteboard)
    import DVTUIKit_Pasteboard
#endif

#if canImport(DVTUIKit_TextField)
    import DVTUIKit_TextField
#endif

#if canImport(DVTUIKit_TextView)
    import DVTUIKit_TextView
#endif

#if canImport(DVTUIKit)
    import DVTUIKit
#endif

class TextViewController: EViewController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        UIPasteboard.dvt.allowRead = true
//        print(UIPasteboard.dvt.general.string)

        self.title = "输入框"
        self.view.addSubview(self.inputBoxView)
        self.view.addSubview(self.textBoxView)

        self.inputBoxView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.dvt.navigationBarHeight + 12)
            make.height.equalTo(56)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }

        self.textBoxView.snp.makeConstraints { make in
            make.top.equalTo(self.inputBoxView.snp.bottom).offset(12)
            make.height.equalTo(156)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
    }

    // MARK: Internal
    lazy var inputBoxView: DVTUITextField = {
        let textField = DVTUITextField()
        textField.placeholder = "请输入"
        textField.borderStyle = .roundedRect
        textField.maximumLength = 10
        textField.clearButtonMode = .whileEditing
        return textField
    }()

    lazy var textBoxView: DVTUITextView = {
        let textView = DVTUITextView()
        textView.placeholder = "请输入"
        textView.font = .dvt.regular(of: 14)
        return textView
    }()
}
