//
//  ViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/6/30.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let dataList = [
        "Foundation" : [
            MainModel.init(name: "协议的实践", controllerName: "ProtocolViewController"),
            MainModel.init(name: "定时器的实践", controllerName: "TimerViewController"),
//            MainModel.init(name: "GCD的使用总结", controllerName: "GCDViewController"),
            MainModel.init(name: "文件转Data", controllerName: "FileDataViewController"),
        ],
        "OC-SWIFT-Bridging" : [
            MainModel.init(name: "Swift调用OC代码", controllerName: "UseOCViewController"),
            MainModel.init(name: "Swift调用swift framework", controllerName: "FrameworkViewController"),
            MainModel.init(name: "Swift调用c代码", controllerName: "UseCViewController"),
            MainModel.init(name: "Swift调用cpp代码", controllerName: "UseCppViewController"),
        ],
        "UITableView" : [
            MainModel.init(name: "代码自定义tableview的cell", controllerName: "CustomTableViewController"),
            MainModel.init(name: "索引和章节tableview", controllerName: "IndexsViewController"),
            MainModel.init(name: "UITableViewCell的accessoryType", controllerName: "SelectViewController"),
            MainModel.init(name: "UITableView Cell的操作", controllerName: "AddViewController"),
        ],
        "WKWebView" : [
            MainModel.init(name: "WKWebView的操作", controllerName: "WKWebViewViewController"),
        ],
    ] as [String : [MainModel]];
    var keys:[String] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tips = "Hello, this is Swift Learning!"
        NSLog("NSLog : \(tips)")
        
        keys = dataList.keys.sorted()
        
        tableView.dataSource = self;
        tableView.delegate = self;
        
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }

}

// MARK: - UITableViewDelegate

extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainModelArr = dataList[keys[indexPath.section]]
        let model = mainModelArr![indexPath.row]
        let destinationStoryboard = UIStoryboard(name:model.controllerName, bundle:nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: model.controllerName)
        self.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension MainViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let mainModelArr = dataList[keys[section]]
        return mainModelArr!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MainTableViewCell.self), for: indexPath) as! MainTableViewCell
        let mainModelArr = dataList[keys[indexPath.section]]
        let model = mainModelArr![indexPath.row]
        cell.titleLabel?.text = model.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
}

// MARK: - MainTableViewCell

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
}

// MARK: - Model

class MainModel {
    var name : String
    var controllerName : String
    
    init(name: String, controllerName: String) {
        self.name = name
        self.controllerName = controllerName
    }
}
