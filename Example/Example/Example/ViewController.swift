//
//  ViewController.swift
//  Example
//
//  Created by darvin on 2021/9/20.
//

import DVTUIKit
import SnapKit
import UIKit

class ViewController: EViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.navigationItem.backButtonTitle = ""
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

    @IBAction func clickButto(_ sender: UIButton) {
        self.navigationController?.pushViewController(ButtonViewController(), animated: true)
    }
}
