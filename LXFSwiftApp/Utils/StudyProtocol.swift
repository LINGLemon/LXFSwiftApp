//
//  StudyProtocol.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/3.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import Foundation

protocol protocola {
    
    var marks: Int { get set }
    var result: Bool { get }
    
    func attendance() -> String
    func markssecured() -> String
    
}

protocol protocolb: protocola {
    
    var present: Bool { get set }
    var subject: String { get set }
    var stname: String { get set }
    
}

/*
 Swift是不允许设置协议的可选的状态，协议声明的方法都是必须实现的。
 可以再协议与方法前面加@objc解决
 */
@objc protocol protocolc {
    @objc optional func test()
}

class classc: protocolb, protocolc {
    var marks = 96
    let result = true
    var present = false
    var subject = "Swift 协议"
    var stname = "Protocols"
    
    func test() {
        print("protocolc - test")
    }
    
    func attendance() -> String {
        return "The \(stname) has secured 99% attendance"
    }
    
    func markssecured() -> String {
        return "\(stname) has scored \(marks)"
    }
}

/*
 对 Mutating 方法的规定
 
 有时需要在方法中改变它的实例。
 例如，值类型(结构体，枚举)的实例方法中，将mutating关键字作为函数的前缀，写在func之前，表示可以在该方法中修改它所属的实例及其实例属性的值。
 */

protocol daysofaweek {
    mutating func show()
}

enum days: daysofaweek {
    case sun, mon, tue, wed, thurs, fri, sat
    mutating func show() {
        switch self {
        case .sun:
            self = .sun
            print("Sunday")
        case .mon:
            self = .mon
            print("Monday")
        case .tue:
            self = .tue
            print("Tuesday")
        case .wed:
            self = .wed
            print("Wednesday")
        case .thurs:
            self = .thurs
            print("Wednesday")
        case .fri:
            self = .fri
            print("Wednesday")
        case .sat:
            self = .sat
            print("Saturday")
        default:
            print("NO Such Day")
        }
    }
}

// MARK: - 委托代理使用

//播放音乐的协议
protocol PlayMusicTools{
    func playMusic();
}

//实现协议的类
class QQMusisApp:PlayMusicTools{
    func playMusic() {
        print("播放一首美妙的音乐")
    }
}

class Person{
    var delegate : PlayMusicTools?
    func listenMusic() {
        self.delegate?.playMusic()
    }
}
