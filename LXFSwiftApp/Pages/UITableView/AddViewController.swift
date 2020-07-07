//
//  AddViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/1.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataSource = [
        ["微信", "支付宝", "银联"],
        ["微信", "支付宝", "银联"]
    ]
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "支付方式"
        
        let rightBar = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addButtonClick))
        navigationItem.rightBarButtonItem = rightBar
        
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    // 导航栏右侧按钮，点击开启或关闭编辑模式
    @objc func addButtonClick() {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "addCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "addCell")
            cell?.selectionStyle = .none
        }
        let arr = dataSource[indexPath.section] as Array
        cell?.textLabel?.text = arr[indexPath.row] as String
        return cell!
    }
    
    // 执行编辑操作时，调用此方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        var arr = dataSource[indexPath.section] as Array
        if editingStyle == .insert {
            arr.insert("Apple Pay", at: indexPath.row)
            dataSource[indexPath.section] = arr
            tableView.insertRows(at: [indexPath], with: .right)
        } else {
            arr.remove(at: indexPath.row)
            dataSource[indexPath.section] = arr
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    // MARK: - UITableViewDelegate
    
    // 编辑模式，增加还是删除
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if indexPath.section == 1 {
//            return .delete
//        }
//        return .insert
//    }
    
    // 添加左滑按钮
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteContextualAction = UIContextualAction.init(style: .destructive, title: "删除") { (action, view, completionHandler)  in

            var arr = self.dataSource[indexPath.section] as Array
            arr.remove(at: indexPath.row)
            self.dataSource[indexPath.section] = arr
            tableView.deleteRows(at: [indexPath], with: .left)

            completionHandler(true);
        }

        let addContextualAction = UIContextualAction.init(style: .normal, title: "添加") { (action, view, completionHandler)  in

            var arr = self.dataSource[indexPath.section] as Array
            arr.insert("Apple Pay", at: indexPath.row)
            self.dataSource[indexPath.section] = arr
            tableView.insertRows(at: [indexPath], with: .right)

            completionHandler(true);
        }
        
        return UISwipeActionsConfiguration(actions: [deleteContextualAction, addContextualAction])
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
