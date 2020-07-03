//
//  ProtocolViewController.swift
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/3.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

import UIKit

/*
    详细见StudyProtocol.swift
 */

class ProtocolViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("协议=================================")
        
        let studdet = classc()
        studdet.stname = "Swift"
        studdet.marks = 98

        print(studdet.marks)
        print(studdet.result)
        print(studdet.present)
        print(studdet.subject)
        print(studdet.stname)
        print(studdet.markssecured())
        studdet.test()
        
        print("mutaing=================================")
        
        var res = days.wed
        res.show()
        
        print("委托代理用法=================================")
        let person:Person = Person()
        person.delegate = QQMusisApp()
        person.listenMusic()
        
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
