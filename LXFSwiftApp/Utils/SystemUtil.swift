//
//  SystemUtil.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/2.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit

class SystemUtil: NSObject {
    
    static let shared = SystemUtil()
    private override init() {}
    
    static func getStatusBarHight() -> CGFloat {
        var statusBarHeight = 0 as CGFloat
        
        if #available(iOS 13.0, *) {
            let statusBarManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager
            statusBarHeight = statusBarManager!.statusBarFrame.size.height
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        
        return statusBarHeight
    }

}
