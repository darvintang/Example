//
//  ViewController.swift
//  Example
//
//  Created by darvin on 2021/9/20.
//

import UIKit
import SnapKit
import DVTUIKit

#if canImport(DVTUIKit_Navigation)
    import DVTUIKit_Navigation
#endif

class ViewController: EViewController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Home"
        self.dataSource = ["Push扫一扫": { [weak self] in
            self?.navigationController?.pushViewController(ScanViewController(), animated: true)
        },
        "Present扫一扫": { [weak self] in
            let nav = UINavigationController(rootViewController: ScanViewController())
            nav.modalPresentationStyle = .fullScreen
            self?.present(nav, animated: true)
        },
        "进度条": { [weak self] in
            self?.navigationController?.pushViewController(ProgressViewController(), animated: true)
        },
        "导航栏": { [weak self] in
            self?.navigationController?.pushViewController(NavBarViewController(), animated: true)
        },
        "按钮": { [weak self] in
            self?.navigationController?.pushViewController(ButtonViewController(), animated: true)
        },
        "提示": { [weak self] in
            self?.navigationController?.pushViewController(TipsViewController(), animated: true)
        },
        "输入框": { [weak self] in
            self?.navigationController?.pushViewController(TextViewController(), animated: true)
        },
        "图片工具": { [weak self] in
            self?.navigationController?.pushViewController(ImageViewController(), animated: true)
        }]

        self.tableView.frame = CGRect(x: 0, y: .dvt.navigationBarHeight, width: .dvt.screenWidth, height: .dvt.screenHeight - .dvt.navigationBarHeight)
        self.view.addSubview(self.tableView)
        self.tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: Internal
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    var dataSource: [String: () -> Void] = [:]
}

extension ViewController: DVTUINavigationControllerDelegate {
    var dvt_navigationBarBackgroundEffect: UIBlurEffect? {
        nil
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataSource.keys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

        cell.textLabel?.text = self.dataSource.keys.map { $0 }[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected(false, animated: true)
        if let key = cell?.textLabel?.text {
            self.dataSource[key]?()
        }
    }
}
