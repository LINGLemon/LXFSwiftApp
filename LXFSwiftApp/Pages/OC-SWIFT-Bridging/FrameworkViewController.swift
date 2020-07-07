//
//  FrameworkViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/6.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit
import SwiftFramework

class FrameworkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testTool = TestTool()
        testTool.openSayHelloWorld();
        testTool.publicSayHelloWorld();
        testTool.sayHelloWorldToOC();
        
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
