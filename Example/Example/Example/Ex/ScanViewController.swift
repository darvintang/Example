//
//  ScanViewController.swift
//  DVTUIKit
//
//  Created by darvin on 2022/8/3.
//

import AVFoundation
import DVTScan
import DVTUIKit
import UIKit

class ScanViewController: EViewController {
    public var scanRect = CGRect(x: 0, y: 100, width: .dvt.screenWidth, height: .dvt.screenHeight * 0.6)
    public lazy var scanView: ScanView = {
        let view = ScanView([.qr], cropRect: self.scanRect) { [weak self] res in
            print("扫码结果：", res ?? "")
            self?.scanCompletion(res)
        }
        view.scanCompletion = { [weak self] _, _ in
            self?.scanAnimationView.stop()
        }
        view.brightnessBlock = { [weak self] brightness in
        }
        return view
    }()

    public lazy var scanAnimationView: ScanAnimationView = {
        let view = ScanAnimationView()
        view.image = UIImage(named: "scan_animation")
        return view
    }()

    lazy var backLabel: UILabel = {
        let label = UILabel()
        label.text = "返回"
        label.dvt.addTapGesture { [weak self] _ in
            if self?.navigationController == nil {
                self?.dismiss(animated: true)
            } else {
                self?.navigationController?.popViewController(animated: true)
            }
        }
        label.frame = CGRect(x: 0, y: 7, width: 44, height: 30)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "扫一扫"
        self.view.clipsToBounds = true
        self.view.backgroundColor = .white
        self.view.addSubview(self.scanView)
        self.view.addSubview(self.scanAnimationView)
        self.scanView.frame = .dvt.screenBounds
        self.scanAnimationView.frame = self.scanRect
        DispatchQueue.dvt.mainAfter(deadline: 0.25) {
            self.initScan()
        }
        self.view.addSubview(self.backLabel)
        self.backLabel.isHidden = self.navigationController != nil
    }

    /// 绘制扫码区域UI
    open func drawScanView() {
    }

    open func scanCompletion(_ result: String?) {
        self.scanAnimationView.stop()
        DispatchQueue.main.async {
            if let navivc = self.navigationController {
                navivc.popViewController(animated: true)
            } else {
                self.dismiss(animated: true)
            }
        }
    }

    /// 初始化扫码工具组件
    open func initScan() {
        self.scanView.frame = self.view.bounds
        if AVCaptureDevice.authorizationStatus(for: .video) != .authorized {
            AVCaptureDevice.requestAccess(for: .video) { flag in
                if flag {
                    _ = try? self.scanView.prepareStart()
                    self.scanAnimationView.start()
                }
            }
        } else {
            _ = try? self.scanView.prepareStart()
            self.scanAnimationView.start()
        }
    }
}
