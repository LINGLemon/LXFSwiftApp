//
//  StaticFrameworkTestTool.swift
//  StaticFrameworkSDK
//
//  Created by 凌煊峰 on 2020/7/20.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit

open class StaticFrameworkTestTool: NSObject {
    // 只能在模块中被调用
    func HelloWorld(withParam param: String) -> Void {
        print(param)
    }
    
    // 可以在模块外被调用，只能在swift中被调用
    public func publicSayHelloWorld() {
        print("sayHelloWorld")
    }
    
    open func openSayHelloWorld() {
        print("sayHelloWorld")
    }
    
    // @objc public 同时修饰，才能在OC项目中被调用；并且也能被swift项目调用
    @objc public func sayHelloWorldToOC() {
        print("sayHelloWorldToOC")
    }
}
