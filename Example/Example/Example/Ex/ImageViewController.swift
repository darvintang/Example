//
//  ImageViewController.swift
//  Example
//
//  Created by darvin on 2023/4/17.
//  Copyright © 2023 cn.tcoding.dvt. All rights reserved.
//

import UIKit

class ImageViewController: EViewController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    // MARK: Internal
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "scan_prompt")
        return view
    }()

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let image = UIImage(named: "scan_prompt")?.dvt.optimalCropping(to: CGRect(x: 0, y: 30, width: .dvt.screenWidth, height: 100))
        self.imageView.image = image
    }
}
