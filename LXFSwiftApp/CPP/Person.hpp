//
//  Person.hpp
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2021/8/30.
//  Copyright © 2021 凌煊峰. All rights reserved.
//

#ifndef Person_hpp
#define Person_hpp

#include <stdio.h>
#include <iostream>

using namespace std;

class Person {
    
public:
    string name;
    int age;
    bool sex;
    
public:
    //默认构造函数，相当于init
    Person();
    //带参数的构造函数，相当于带参数的init
    Person(const char* name , const int age , const bool sex);
    //析构函数，用来释放资源，相当于deinit
    ~Person();
   
    //自我介绍
    void introduceMySelf();
    
};

#endif /* Person_hpp */
