//
//  SelectViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/1.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource = [
        ["微信支付":"select"],
        ["支付宝支付":"on"],
        ["银联支付":"no"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "selectCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "selectCell")
            cell?.selectionStyle = .none
        }
        let dic = dataSource[indexPath.row] as Dictionary
        cell?.textLabel?.text = dic.keys.first
        if dic.values.first == "select" {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var i = 0
        for var dict in dataSource {
            if i == indexPath.row {
                dict[dict.keys.first!] = "select"
                dataSource[i] = dict
            } else {
                dict[dict.keys.first!] = "no"
                dataSource[i] = dict
            }
            i = i + 1
        }
        tableView.reloadData()
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
