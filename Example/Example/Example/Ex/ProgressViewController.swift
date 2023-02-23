//
//  ProgressViewController.swift
//  Example
//
//  Created by darvin on 2022/8/15.
//  Copyright © 2022 cn.tcoding.dvt. All rights reserved.
//

#if canImport(DVTUIKit_Progress)
    import DVTUIKit_Progress
#elseif canImport(DVTUIKit)
    import DVTUIKit_
#endif

import SnapKit
import UIKit

class ProgressViewController: EViewController {
    lazy var title1Label: UILabel = {
        let label = UILabel()
        label.text = "进度条"
        return label
    }()

    lazy var title2Label: UILabel = {
        let label = UILabel()
        label.text = "滑动条"
        return label
    }()

    lazy var progressView: DVTProgressView = {
        let view = DVTProgressView()
        view.progressColors = [.white.dvt.alpha(0.5), .blue, .green, .black]
        return view
    }()

    lazy var slideView: DVTSlideView = {
        let view = DVTSlideView()
        view.progressColors = [.white.dvt.alpha(0.5), .blue, .green, .black]
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "进度条，点击空白区域调整"

        self.view.addSubview(self.progressView)
        self.view.addSubview(self.title1Label)

        self.view.addSubview(self.slideView)
        self.view.addSubview(self.title2Label)

        self.progressView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.dvt.navigationBarHeight + 20)

            make.left.equalToSuperview().offset(30)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        self.title1Label.snp.makeConstraints { make in
            make.centerX.equalTo(self.progressView)
            make.top.equalTo(self.progressView.snp.bottom).offset(20)
        }

        self.slideView.snp.makeConstraints { make in
            make.top.equalTo(self.title1Label.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(30)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
        }
        self.title2Label.snp.makeConstraints { make in
            make.centerX.equalTo(self.slideView)
            make.top.equalTo(self.slideView.snp.bottom).offset(20)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.progressView.progress = CGFloat.random(in: 0.1 ... 0.8)
        self.slideView.progress = CGFloat.random(in: 0.1 ... 0.8)
    }
}
