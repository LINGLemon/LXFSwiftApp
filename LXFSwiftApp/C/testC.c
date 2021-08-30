//
//  testC.c
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2021/8/30.
//  Copyright © 2021 凌煊峰. All rights reserved.
//

#include "testC.h"

void showValue(int *value) {
    printf("old value = %d\n",*value);
    *value = *value + 1;
    printf("new value = %d\n",*value);
}
