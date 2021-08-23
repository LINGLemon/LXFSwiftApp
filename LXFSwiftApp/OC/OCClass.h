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

typedef NS_ENUM(UInt8, LXF_TestType) {
    LXF_TestTypeDo               = 0,    //开始传输文件数据
    LXF_TestTypeDone             = 1,    //结束传输文件数据
    LXF_TestTypeDoing            = 2,    //正在传输文件数据
    LXF_TestTypeCancel           = 3,    //取消传输文件数据
    LXF_TestTypeError            = 4,    //传输文件数据出错
    LXF_TestTypeUnknown,
};

@interface OCClass : NSObject

@property (nonatomic, weak) id<OCClassProtocol> delegate;

void testc(void);

+ (void)testStaticOC;

- (void)testOC;


- (void)testOCWithParm:(NSString *)parm;

- (void)testOCWithParm1:(NSString *)parm1 withParm2:(NSString *)parm2;

- (void)useOptionalOCWithParm;

- (void)useRequiredOCWithParm;

@end

NS_ASSUME_NONNULL_END
