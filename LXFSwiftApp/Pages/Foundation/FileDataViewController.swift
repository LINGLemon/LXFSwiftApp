//
//  FileDataViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2021/8/30.
//  Copyright © 2021 凌煊峰. All rights reserved.
//

import UIKit

class FileDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // OC版
//        NSData *tmpData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
        
        // swift版
//        let filePath = "文件路径"
//        let fileData : Data = FileManager.default.contents(atPath: filePath)!
//        NSLog("fileData : \(fileData)")
        NSLog("详情请看代码写法")
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
