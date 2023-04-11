//
//  EViewController.swift
//  Example
//
//  Created by darvin on 2022/8/8.
//

import UIKit

class EViewController: UIViewController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(dvt: "0xf8f8f8")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: Private
    private var test:String = ""
}
