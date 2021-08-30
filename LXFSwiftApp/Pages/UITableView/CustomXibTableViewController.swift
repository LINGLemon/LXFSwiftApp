//
//  CustomXibTableViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2021/8/30.
//  Copyright © 2021 凌煊峰. All rights reserved.
//

import UIKit

class CustomXibTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = [
        ["name":"王小明2", "sex":"男", "icon":"my_def_photo", "birthday":"2017-10-11"],
        ["name":"李磊2", "sex":"男", "icon":"my_def_photo", "birthday":"2011-12-30"],
        ["name":"韩梅2", "sex":"女", "icon":"my_def_photo", "birthday":"2014-9-10"],
        ["name":"JIM2", "sex":"男", "icon":"my_def_photo", "birthday":"2008-10-1"],
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: NSStringFromClass(CustomTableViewCell.self))
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomTableViewCell? = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(CustomTableViewCell.self)) as? CustomTableViewCell
        let dict:Dictionary = dataSource[indexPath.row]
//        cell?.iconImageView.image = UIImage(named: dict["icon"]!)
        cell?.userLabel.text = dict["name"]
        cell?.sexLabel.text = dict["sex"]
        cell?.birthdayLabel.text = dict["birthday"]
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    
    // 设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74.0
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
