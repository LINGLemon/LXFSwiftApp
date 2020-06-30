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
        "自定义tableview",
        "可选类型",
    ];

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self;
        tableView.delegate = self;
        
        tableView.register(MainTableViewCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(MainTableViewCell.self))
        
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
    }
}

//MARK: - UITableView数据源和代理方法 -

extension MainViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MainTableViewCell.self)) as! MainTableViewCell
        if cell == nil {
            cell = MainTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: NSStringFromClass(MainTableViewCell.self))
        }
        cell.textLabel?.text = dataList[indexPath.row];
        
        return cell
    }
}

//MARK: - MainTableViewCell -

class MainTableViewCell: UITableViewCell {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }
    
}

