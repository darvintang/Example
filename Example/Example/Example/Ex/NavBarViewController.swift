//
//  NavBarViewController.swift
//  Example
//
//  Created by darvin on 2023/1/9.
//  Copyright © 2023 cn.tcoding.dvt. All rights reserved.
//

#if canImport(DVTUIKit_Navigation)
    import DVTUIKit_Navigation
#elseif canImport(DVTUIKit)
    import DVTUIKit
#endif

import DVTLoger
import UIKit

class NavBarViewController: EViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "导航栏\(self.count)"
        let rightLabel = UILabel()
        rightLabel.text = "跳转"
        rightLabel.sizeToFit()
        rightLabel.dvt.addTapGesture { [weak self] _ in
            self?.navigationController?.pushViewController(NavBarViewController(), animated: true)
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightLabel)

        let toLabel = UILabel()
        toLabel.text = "跳转"
        toLabel.dvt.addTapGesture { [weak self] _ in
            self?.navigationController?.pushViewController(NavBarViewController(), animated: true)
        }
        toLabel.frame = CGRect(x: 100, y: .dvt.navigationBarHeight + 120, width: 100, height: 30)
        self.view.addSubview(toLabel)

        let to1Label = UILabel()
        to1Label.text = "跳转1"
        to1Label.dvt.addTapGesture { [weak self] _ in
            let vc = ScanViewController()
            self?.navigationController?.present(vc, animated: true)
        }
        to1Label.frame = CGRect(x: 100, y: .dvt.navigationBarHeight + 210, width: 100, height: 30)
        self.view.addSubview(to1Label)

        let backLabel = UILabel()
        backLabel.text = "返回"
        backLabel.dvt.addTapGesture { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
        backLabel.frame = CGRect(x: 100, y: .dvt.navigationBarHeight + 160, width: 100, height: 30)
        self.view.addSubview(backLabel)
    }

    lazy var count: Int = {
        self.navigationController?.viewControllers.count ?? 0
    }()
}

extension NavBarViewController: DVTUINavigationControllerDelegate {
    var dvt_navigationBarHidden: Bool {
        self.count % 5 == 0
    }

//    var dvt_navigationBarBackgroundColor: UIColor? {
//        return [UIColor.red, .blue, .brown, .darkGray, .cyan, .gray][self.count % 6]
//    }

    var dvt_navigationBarBackgroundImage: UIImage? {
        let list = [UIColor.red, .blue, .brown, .darkGray, .cyan, .gray]
        let indexStert = self.count % 6
        let indexEnd = self.count * 2 % 5
        return UIImage(dvt: [.clear.dvt.alpha(0.1), list[indexStert].dvt.alpha(0.9), .black.dvt.alpha(0.2), list[indexEnd].dvt.alpha(0.9)], size: CGSize(width: .dvt.screenWidth, height: .dvt.navigationBarHeight))
    }

    var dvt_navigationBarShadowColor: UIColor? {
        .red
    }

//    var dvt_navigationBarShadowImage: UIImage? {
//        UIImage(dvt: .green)
//    }

    var dvt_navigationBarBackgroundEffect: UIBlurEffect? {
        nil
    }

    var dvt_navigationBarTintColor: UIColor? {
        .white
    }

//    var dvt_backImage: UIImage? {
//        UIImage(named: "scan_focus")?.dvt.image(blendColors: [.red.dvt.alpha(0.1), .black.dvt.alpha(0.1)])
//    }

    var dvt_navigationBarBackTitle: String? {
        "\(self.count)"
    }
}
