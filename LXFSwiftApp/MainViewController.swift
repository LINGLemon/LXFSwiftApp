//
//  ViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/6/30.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
//    let cellID = "MainTableViewCell"
    
    let dataList = [
        "Foundation" : [
            MainModel.init(name: "协议的实践", controllerName: "ProtocolViewController"),
        ],
        "OC-SWIFT-Bridging" : [
            MainModel.init(name: "swift调用OC代码", controllerName: "UseOCViewController"),
            MainModel.init(name: "swift调用swift framework", controllerName: "FrameworkViewController"),
        ],
        "UITableView" : [
            MainModel.init(name: "自定义tableview", controllerName: "CustomTableViewController"),
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

//MARK: - UITableView代理方法 -

extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainModelArr = dataList[keys[indexPath.section]]
        let model = mainModelArr![indexPath.row]
        let destinationStoryboard = UIStoryboard(name:model.controllerName, bundle:nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: model.controllerName)
        self.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}

//MARK: - UITableView数据源和代理方法 -

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

//MARK: - MainTableViewCell -

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
}

//MARK: - Model -

class MainModel {
    var name : String
    var controllerName : String
    
    init(name: String, controllerName: String) {
        self.name = name
        self.controllerName = controllerName
    }
}
