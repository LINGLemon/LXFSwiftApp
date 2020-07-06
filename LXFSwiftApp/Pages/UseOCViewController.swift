//
//  UseOCViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/6.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit

class UseOCViewController: UIViewController, OCClassProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 调用C方法
        
        testc()
        
        // MARK: - 调用OC方法

        let oc = OCClass()
        oc.testOC()
        oc.testOC(withParm: "ahh")
        oc.testOC(withParm1: "ahh1", withParm2: "ahh2")
        
        // MARK: - 遵守OC的代理
        
        oc.delegate = self
        oc.useOptionalOCWithParm()
        oc.useRequiredOCWithParm()
        
    }
    
    // MARK: - OCClassProtocol
    
    func optionalOC(withParm parm: String) {
        print("optionalOC")
    }
    
    func requiredOC(withParm parm: String) {
        print("requiredOC \(parm)")
    }
    
}
