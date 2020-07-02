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
    var btnBack = UIBarButtonItem()
    var btnForward = UIBarButtonItem()
    var progBar = UIProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取导航栏高度
        let navHeight = self.navigationController?.navigationBar.frame.height
        //获取状态栏高度
        let statusHeight = SystemUtil.getStatusBarHight()
        
        // 创建wkwebview
        webview = WKWebView(frame: CGRect(x: 0, y: statusHeight + navHeight!, width: self.view.frame.width, height: self.view.frame.height))
        
        setNavBar()
        
        webview.navigationDelegate = self
        // 创建网址
        let url = NSURL(string: "http://www.baidu.com")
        // 创建请求
        let request = NSURLRequest(url: url! as URL)
        // 加载请求
        webview.load(request as URLRequest)
        // 添加wkwebview
        self.view.addSubview(webview)
        
        // 加载网页的进度条
        progBar = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
        progBar.progress = 0.0
        progBar.tintColor = UIColor.red
        webview.addSubview(progBar)
        // 监听网页加载的进度
        webview.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        webview.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.navigationItem.title = webview.title
    }
    
    // MARK: - WKUIDelegate
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        // 实现非安全链接的跳转。如果目标主视图不为空,则允许导航
        if !(navigationAction.targetFrame?.isMainFrame != nil) {
            webview.load(navigationAction.request)
        }
        return nil
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        // 修复弹窗弹出的问题
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) -> Void in
            completionHandler()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - webview function
    
    @objc func toBack() {
        if webview.canGoBack {
            webview.goBack()
        }
    }
     
    @objc func toForward() {
        if webview.canGoForward {
            webview.goForward()
        }
    }
    
    func setNavBar() {
        btnBack = UIBarButtonItem(title: "后退", style: .plain, target: self, action: #selector(toBack))
        btnForward = UIBarButtonItem(title: "前进", style: .plain, target: self, action: #selector(toForward))
        self.navigationItem.rightBarButtonItems = [btnBack, btnForward]
    }
    
    // MARK: - KVO

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            self.progBar.alpha = 1.0
            progBar.setProgress(Float(webview.estimatedProgress), animated: true)
             //进度条的值最大为1.0
            if(self.webview.estimatedProgress >= 1.0) {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseInOut, animations: { () -> Void in
                    self.progBar.alpha = 0.0
                }, completion: { (finished:Bool) -> Void in
                    self.progBar.progress = 0
                })
            }
        }
    }
    
    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
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
