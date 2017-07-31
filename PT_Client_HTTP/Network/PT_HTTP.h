//
//  PT_HTTP.h
//  PT_Client_HTTP
//
//  Created by 天蓝 on 2017/7/26.
//  Copyright © 2017年 PT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PT_HTTP : NSObject

+ (instancetype)sharedPT_HTTP;


/**
 平常的post请求
 
 @param action 接口名
 @param parameters 参数
 @param success 成功的回调
 */
+ (void)POST:(NSString *)action
  parameters:(NSDictionary *)parameters
     success:(void (^)(NSDictionary * responseObject))success;


/**
 平常的post请求

 @param action 接口名
 @param parameters 参数
 @param success 成功的回调
 @param failure 失败的回调
 */
+ (void)POST:(NSString *)action
  parameters:(NSDictionary *)parameters
     success:(void (^)(NSDictionary * responseObject))success
     failure:(void (^)(NSError *error))failure;


/**
 平常的post请求
 
 @param action 接口名
 @param parameters 参数
 @param success 成功的回调
 @param failure 失败的回调
 @param timeoutInterval 超时时间
 */
+ (void)POST:(NSString *)action
  parameters:(NSDictionary *)parameters
     success:(void (^)(NSDictionary * responseObject))success
     failure:(void (^)(NSError *error))failure
timeoutInterval:(CGFloat)timeoutInterval;
@end
