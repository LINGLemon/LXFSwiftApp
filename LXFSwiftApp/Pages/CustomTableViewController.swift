//
//  CustomTableViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/1.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit

class CustomTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = [
        ["name":"王小明", "sex":"男", "icon":"my_def_photo", "birthday":"2017-10-11"],
        ["name":"李磊", "sex":"男", "icon":"my_def_photo", "birthday":"2011-12-30"],
        ["name":"韩梅", "sex":"女", "icon":"my_def_photo", "birthday":"2014-9-10"],
        ["name":"JIM", "sex":"男", "icon":"my_def_photo", "birthday":"2008-10-1"],
    ]
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(NewTableViewCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(NewTableViewCell.self))
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:NewTableViewCell? = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(NewTableViewCell.self)) as? NewTableViewCell
        if cell==nil {
            cell = NewTableViewCell(style: .subtitle, reuseIdentifier: NSStringFromClass(NewTableViewCell.self))
        }
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
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    // 选中cell后执行此方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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

class NewTableViewCell: UITableViewCell {

    let width:CGFloat = UIScreen.main.bounds.width
    var userLabel:UILabel!      // 名字
    var birthdayLabel:UILabel!  // 出生日期
    var sexLabel:UILabel!       // 性别
    var iconImageView:UIImageView!    // 头像
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 头像
        iconImageView = UIImageView(frame: CGRect(x: 20, y: 15, width: 44, height: 44))
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = 22.0
        iconImageView.backgroundColor = UIColor.lightGray
        
        // 名字
        userLabel = UILabel(frame: CGRect(x: 74, y: 18, width: 70, height: 15))
        userLabel.textColor = UIColor.black
        userLabel.font = UIFont.boldSystemFont(ofSize: 15)
        userLabel.textAlignment = .left
        
        // 性别
        sexLabel = UILabel(frame: CGRect(x: 150, y: 20, width: 50, height: 13))
        sexLabel.textColor = UIColor.black
        sexLabel.font = UIFont.systemFont(ofSize: 13)
        sexLabel.textAlignment = .left
        
        // 出生日期
        birthdayLabel = UILabel(frame: CGRect(x: 74, y: 49, width: width-94, height: 13))
        birthdayLabel.textColor = UIColor.gray
        birthdayLabel.font = UIFont.systemFont(ofSize: 13)
        birthdayLabel.textAlignment = .left
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(userLabel)
        contentView.addSubview(sexLabel)
        contentView.addSubview(birthdayLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


