//
//  ViewController.swift
//  Example
//
//  Created by darvin on 2021/9/20.
//

import DVTUIKit
import DVTUIKitNavigation
import SnapKit
import UIKit

class ViewController: EViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home"
    }

    @IBAction func clickPushScan(_ sender: UIButton) {
        self.navigationController?.pushViewController(ScanViewController(), animated: true)
    }

    @IBAction func clickPresentScan(_ sender: UIButton) {
        self.present(ScanViewController(), animated: true)
    }

    @IBAction func clickProgress(_ sender: UIButton) {
        self.navigationController?.pushViewController(ProgressViewController(), animated: true)
    }

    @IBAction func clickKeyboardBtn(_ sender: UIButton) {
        self.navigationController?.pushViewController(KeyboardViewController(), animated: true)
    }

    @IBAction func clickNavBar(_ sender: UIButton) {
        self.navigationController?.pushViewController(NavBarViewController(), animated: true)
    }

    @IBAction func clickButton(_ sender: UIButton) {
        self.navigationController?.pushViewController(ButtonViewController(), animated: true)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ViewController: DVTUINavigationControllerDelegate {
    var dvt_navigationBarBackgroundEffect: UIBlurEffect? {
        nil
    }
}
