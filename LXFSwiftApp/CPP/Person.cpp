//
//  Person.cpp
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2021/8/30.
//  Copyright © 2021 凌煊峰. All rights reserved.
//

#include "Person.hpp"
#include "PersonExtern.h"

Person::Person(){
    age = 12;
    sex = true;
    name = "LINGLemon";
}

Person::Person(const char* name , const int age , const bool sex){
    this->age = age;
    this->sex = sex;
    
    long len = strlen(name);
    char * cpname = new char[len + 1];
    strcpy(cpname, name);
    this->name = cpname;
}

Person::~Person(){
    cout << "Person destruct\n";
}

void Person::introduceMySelf(){
    cout << "Hello, I am " << name << ", my age is " << age << " years old. ";
    if (sex) {
        cout << "I am a boy.\n";
    } else {
        cout << "I am a girl.\n";
    }
}

#pragma mark - 实现PersonExtern.h中的函数

void* person_init() {
    return new Person();
}

void person_introduceMySelf(void* person) {
    Person *p = (Person*)person;
    p->introduceMySelf();
}
