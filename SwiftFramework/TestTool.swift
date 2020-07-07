//
//  TestTool.swift
//  SwiftFramework
//
//  Created by 凌煊峰 on 2020/7/6.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit

/*
 什么时候用 Open 什么时候用 Public?
 Open 在作用域外是可以被访问,继承 ,用 Open 关键字修饰的开放类成员在作用域之外是可访问和可覆盖的。
 Pubic 在作用域外是可访问的，但在作用域之外没有子类。公共类成员是可访问的，但在作用域之外是不可覆盖的。
*/

open class TestTool: NSObject {
    
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
