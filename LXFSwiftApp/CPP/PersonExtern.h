//
//  PersonExtern.h
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2021/8/30.
//  Copyright © 2021 凌煊峰. All rights reserved.
//

#ifndef PersonExtern_h
#define PersonExtern_h

typedef void* CPP_Person;

#ifdef __cplusplus
extern "C"{
#endif
    /**
     *  Swift能直接使用C代码但不能直接使用C++代码，所以在写好C++代码后，要使用C代码对C++代码进行封装
     *  把C代码的函数声明暴露到这个文件，函数实现在cpp文件中
     */
    // 在这里写上C的函数声明
    // 初始化一个Person的实例
    CPP_Person person_init();
    // 调用Person实例的方法
    void person_introduceMySelf(CPP_Person person);
#ifdef __cplusplus
}
#endif

#endif /* PersonExtern_h */
