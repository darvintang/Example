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

#if canImport(DVTUIKit_Tips)
    import DVTUIKit_Tips
#endif

class TipsViewController: EViewController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "提示"
        self.t = Test()

        self.view.addSubview(self.loadingView)
        self.view.addSubview(self.infoView)
        self.view.addSubview(self.errorView)
        self.view.addSubview(self.successView)
        self.view.addSubview(self.textView)

        self.loadingView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(self.loadingView.snp.width)
            make.top.equalToSuperview().offset(CGFloat.dvt.navigationBarHeight)
            make.left.equalToSuperview()
        }
        self.infoView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(self.infoView.snp.width)
            make.top.equalToSuperview().offset(CGFloat.dvt.navigationBarHeight)
            make.right.equalToSuperview()
        }
        self.errorView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(self.errorView.snp.width)
            make.top.equalTo(self.loadingView.snp.bottom)
            make.left.equalToSuperview()
        }
        self.successView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(self.successView.snp.width)
            make.top.equalTo(self.loadingView.snp.bottom)
            make.right.equalToSuperview()
        }
        self.textView.snp.makeConstraints { make in
            make.height.equalTo(self.successView)
            make.top.equalTo(self.successView.snp.bottom)
            make.right.left.equalToSuperview()
        }
        self.loadingView.dvt.addTapGesture { view in
            view.dvt.showLoading(style: DVTUITipsStyle(timeout: 5))
        }
        self.infoView.dvt.addTapGesture { [weak self] view in
            view.dvt.showInfo("信息")
            self?.t?.update()
        }
        self.errorView.dvt.addTapGesture { view in
            view.dvt.showError("失败")
        }
        self.successView.dvt.addTapGesture { view in
            view.dvt.showSuccess("成功")
        }
        self.textView.dvt.addTapGesture { view in
            view.dvt.showText("测试")
        }
    }

    // MARK: Internal
    lazy var loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = .dvt.random
        return view
    }()

    lazy var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .dvt.random
        return view
    }()

    lazy var errorView: UIView = {
        let view = UIView()
        view.backgroundColor = .dvt.random
        return view
    }()

    lazy var successView: UIView = {
        let view = UIView()
        view.backgroundColor = .dvt.random
        return view
    }()

    lazy var textView: UIView = {
        let view = UIView()
        view.backgroundColor = .dvt.random
        return view
    }()

    var t: Test? {
        didSet {
            eLoger.debug("修改属性t")
        }
    }
}

struct Test {
    private(set) var age = 1

    mutating func update() {
        self.age += 1
    }
}
