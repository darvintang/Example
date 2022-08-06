//
//  ViewController.swift
//  Example
//
//  Created by darvin on 2021/9/20.
//

import DVTScan
import UIKit
import Vision

class ViewController: UIViewController {
    lazy var resultImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.navigationItem.backButtonTitle = ""
        self.resultImageView.frame = self.view.bounds
        self.view.insertSubview(self.resultImageView, at: 0)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let image = UIImage(named: "code_test_1") {
            self.resultImageView.image = image
            ScanTool.scan(image) { list in
                if let list = list {
                    for res in list {
                        let view = UILabel()
                        view.text = res.payloadStringValue
                        view.backgroundColor = .dvt.random
                        view.frame = res.dvt.into(canvasImage: image, to: self.resultImageView.bounds, mode: self.resultImageView.contentMode)
                        self.resultImageView.addSubview(view)
                    }
                }
            }
        }
    }

    @IBAction func clickPushScan(_ sender: UIButton) {
        self.navigationController?.pushViewController(ScanViewController(), animated: true)
    }

    @IBAction func clickPresentScan(_ sender: UIButton) {
        self.present(ScanViewController(), animated: true)
    }
}
