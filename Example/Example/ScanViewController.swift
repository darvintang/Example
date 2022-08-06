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
import Vision

class ScanViewController: UIViewController {
    public var scanRect = CGRect(x: 0, y: 100, width: .dvt.screenWidth, height: .dvt.screenHeight * 0.6)
    public lazy var scanView: ScanView = {
        let view = ScanView([.qr], cropRect: self.scanRect) { [weak self] res in
            print("扫码结果：", res ?? "")
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                try? self?.scanView.prepareStart()
                self?.scanAnimationView.start()
            }
        }
        view.scanCompletion = { [weak self] _, _ in
            self?.scanAnimationView.stop()
        }
        return view
    }()

    public lazy var scanAnimationView: ScanAnimationView = {
        let view = ScanAnimationView()
        view.image = UIImage(named: "scan_animation")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "扫一扫"
        self.view.backgroundColor = .white
        self.view.addSubview(self.scanView)
        self.view.addSubview(self.scanAnimationView)
        self.scanView.frame = .dvt.screenBounds
        self.scanAnimationView.frame = self.scanRect
        DispatchQueue.dvt.mainAfter(deadline: 0.25) {
            self.initScan()
        }
    }

    /// 绘制扫码区域UI
    open func drawScanView() {
    }

    /// 初始化扫码工具组件
    open func initScan() {
        self.scanView.frame = self.view.bounds
        try? self.scanView.prepareStart()
        self.scanAnimationView.start()
        self.navigationController?.navigationBar.barStyle = .black
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
