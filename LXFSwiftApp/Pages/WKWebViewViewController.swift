//
//  WKWebViewViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/2.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var webview = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建wkwebview
        let webview = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        // 创建网址
        let url = NSURL(string: "http://www.baidu.com")
        // 创建请求
        let request = NSURLRequest(url: url! as URL)
        // 加载请求
        webview.load(request as URLRequest)
        // 添加wkwebview
        self.view.addSubview(webview)
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
