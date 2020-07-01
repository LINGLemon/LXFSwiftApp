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
        MainModel.init(name: "自定义tableview", controllerName: "CustomTableViewController"),
        ] as [MainModel];

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        print("选择了\(indexPath.row)行")
        let model = dataList[indexPath.row]
        let destinationStoryboard = UIStoryboard(name:model.controllerName, bundle:nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: model.controllerName)
        self.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}

//MARK: - UITableView数据源和代理方法 -

extension MainViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MainTableViewCell.self), for: indexPath) as! MainTableViewCell
        let model = dataList[indexPath.row]
        cell.titleLabel?.text = model.name
        
        return cell
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
