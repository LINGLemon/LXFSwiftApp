//
//  OCUseFramework.m
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/20.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

#import "OCUseFramework.h"

#import <SwiftFramework/SwiftFramework.h>
#import <StaticFrameworkSDK/StaticFrameworkSDK.h>

@interface OCUseFramework()

@end

@implementation OCUseFramework

- (void)useSwiftFrameworkMethod {
    TestTool *testTool = [TestTool new];
    [testTool sayHelloWorldToOC];
    
    StaticFrameworkTestTool *tool2 = [StaticFrameworkTestTool new];
    [tool2 sayHelloWorldToOC];
}

@end
