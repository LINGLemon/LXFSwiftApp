//
//  OCClass.m
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/6.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

#import "OCClass.h"

@interface OCClass()

@end

@implementation OCClass

+ (void)testStaticOC {
    printf("testStaticOC.....................\n");
}

void testc() {
    printf("testc.....................\n");
}

- (void)testOC {
    NSLog(@"testOC.........................");
}

- (void)testOCWithParm:(NSString *)parm {
    NSLog(@"%@", [NSString stringWithFormat:@"testOCWithParm: parm:%@", parm]);
}

- (void)testOCWithParm1:(NSString *)parm1 withParm2:(NSString *)parm2 {
    NSLog(@"%@", [NSString stringWithFormat:@"testOCWithParm1: parm1:%@, parm2:%@", parm1, parm2]);
}

- (void)useOptionalOCWithParm {
    if (self.delegate && [self.delegate respondsToSelector:@selector(optionalOCWithParm:)]) {
        [self.delegate optionalOCWithParm:@"self.delegate optionalOCWithParm"];
    }
}

- (void)useRequiredOCWithParm {
    if (self.delegate && [self.delegate respondsToSelector:@selector(requiredOCWithParm:)]) {
        [self.delegate requiredOCWithParm:@"self.delegate requiredOCWithParm"];
    }
}

@end
