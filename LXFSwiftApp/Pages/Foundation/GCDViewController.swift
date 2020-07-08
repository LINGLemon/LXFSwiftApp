//
//  GCDViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/7.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit

class GCDViewController: UIViewController {
    
    // 串行队列
    let serial = DispatchQueue(label: "serial", attributes: .init(rawValue:0))
    // 并发队列
    let concurrent = DispatchQueue(label: "serial", attributes: .concurrent)
    // 主队列
    let mainQueue = DispatchQueue.main
    // 全局队列
    let global = DispatchQueue.global()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 延时执行
        print("MARK: - 延时执行")
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 1) {
            print("延时任务")
        }
        
        // MARK: - 主队列与全局队列的概念
        /*
         主队列（特殊的串行队列）
         专门用来在主线程上调度任务的队列
         不会开始线程
         如果当前主线程正在由任务执行,那么无论主队列中当前被添加了什么任务,都不会被调度
         可以理解为串行队列(serial),但是它的行为并不完全像常规的串行队列
         在main()函数创建之前就有主队列了
         */
        /*
         全局队列:
         为了方便程序员的使用,苹果提供了全局队列:dispatch_get_global_queue(0, 0)
         全局队列是一个并发队列(concurrent)
         在使用多线程开发时,如果对队列没有特殊需求,在执行异步任务时,可以直接使用全局队列
         */
        
        // MARK: - 主队列+同步任务——死锁
//        print(1)
//        DispatchQueue.main.sync {
//            print(2)
//        }
//        print(3)
        
        // MARK: - 主队列+异步任务——依次执行（不开启新线程）
        print("MARK: - 主队列+异步任务——依次执行（不开启新线程）")
        print(1)
        DispatchQueue.main.async {
            print(2)
        }
        print(3)
        
        // MARK: - 串行队列+同步任务——依次执行
        print("MARK: - 串行队列+同步任务——依次执行")
        var serial = DispatchQueue(label: "serial", attributes: .init(rawValue:0))
        for i in 0...10 {
            serial.sync {
                sleep(arc4random() % 3)//休眠时间随机
                print(i)
            }
        }
        
        // MARK: - 串行队列+异步任务——开启一个新线程依次执行
        print("MARK: - 串行队列+异步任务——开启一个新线程依次执行")
        serial = DispatchQueue(label: "serial",attributes: .init(rawValue:0))
        print(Thread.current)//主线程
        for i in 0...10 {
            serial.async {
                sleep(arc4random()%3)//休眠时间随机
                print(i,Thread.current)//子线程
            }
        }
        
        // MARK: - 并发队列+同步任务——依次执行
        print("MARK: - 并发队列+同步任务——依次执行")
        for i in 0...10 {
            DispatchQueue.global().sync {
                sleep(arc4random() % 3)//休眠时间随机
                print(i, Thread.current)
            }
        }
        
        // MARK: - 并发队列+异步任务——开启多个线程并发执行
        print("MARK: - 并发队列+异步任务——开启多个线程并发执行")
        for i in 0...10 {
            DispatchQueue.global().async {
                sleep(arc4random() % 3)//休眠时间随机
                print(i, Thread.current)
            }
        }
        
        // MARK: - GCD 栅栏
        print("MARK: - GCD 栅栏")
        for i in 0...10 {
            DispatchQueue.global().async {
                print(i)
            }
        }
        DispatchQueue.global().async(flags: .barrier) {
            print("this is barrier")
        }
        for i in 11...20 {
            DispatchQueue.global().async {
                print(i)
            }
        }
        
        // MARK: - GCD group
        print("MARK: - GCD group")
        let group = DispatchGroup()
        for i in 0...10 {
            DispatchQueue.global().async(group: group) {
                sleep(arc4random() % 3)//休眠时间随机
                print(i)
            }
        }
        //queue参数表示以下任务添加到的队列
        group.notify(queue: DispatchQueue.main) {
            print("group 任务执行结束")
        }
    }
    
}
