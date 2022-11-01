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

    @IBAction func clickButton(_ sender: UIButton) {
//        let center = UNUserNotificationCenter.current()
//
//        let content = UNMutableNotificationContent()
//        content.title = "测试标题"
//        content.subtitle = "测试通知副标题"
//        content.body = "测试通知的具体内容"
//        content.badge = 1
//        let time = Date(timeIntervalSinceNow: 3).timeIntervalSinceNow
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
//        let identifier = "noticeId"
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//
//        center.add(request)

        UIWindowScene.main?.dvt.rotate(to: .landscapeRight)

//        self.navigationController?.pushViewController(ButtonViewController(), animated: true)
    }
}
