//
//  OCClass.h
//  LXFSwiftApp
//
//  Created by 凌煊峰 on 2020/7/6.
//  Copyright © 2020 凌煊峰. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OCClassProtocol <NSObject>

@optional

- (void)optionalOCWithParm:(NSString *)parm;

@required

- (void)requiredOCWithParm:(NSString *)parm;

@end

@interface OCClass : NSObject

@property (nonatomic, weak) id<OCClassProtocol> delegate;

void testc(void);

- (void)testOC;


- (void)testOCWithParm:(NSString *)parm;

- (void)testOCWithParm1:(NSString *)parm1 withParm2:(NSString *)parm2;

- (void)useOptionalOCWithParm;

- (void)useRequiredOCWithParm;

@end

NS_ASSUME_NONNULL_END
