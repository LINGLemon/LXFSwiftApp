//
//  IndexsViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/1.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit

class IndexsViewController: UIViewController, UITableViewDataSource {
    
    let contents:Dictionary<String,[String]> =
        ["A":["安其拉"],
         "B":["步惊云","不知火舞","白起","扁鹊"],
         "C":["程咬金","成吉思汗","蔡文姬","曹操"],
         "D":["妲己","狄仁杰","典韦","貂蝉","达摩","大乔","东皇太一"],
         "G":["高渐离","关羽","宫本武藏","干将莫邪","鬼谷子"],
         "H":["韩信","后羿","花木兰","黄忠"],
         "J":["荆轲","姜子牙"],
         "L":["老夫子","刘邦","刘婵","鲁班七号","兰陵王","露娜","廉颇","李元芳","刘备","李白","吕布"],
         "M":["墨子","芈月"],
         "N":["牛魔","娜可露露","哪吒","女娲"],
         "P":["庞统",""],
         "S":["孙膑","孙尚香","孙悟空"],
         "W":["王昭君","武则天"],
         "X":["项羽","小乔"],
         "Y":["亚瑟","虞姬","嬴政"],
         "Z":["周瑜","庄周","甄姬","钟无艳","张飞","张良","钟馗","赵云","诸葛亮"]]
    var keys:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        keys = contents.keys.sorted()
        
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        view.addSubview(tableView)

    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = contents[keys[section]]
        return (arr?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "indexsCellId")
        if cell==nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "indexsCellId")
        }
        let arr = contents[keys[indexPath.section]]
        cell?.textLabel?.text = arr?[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
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
