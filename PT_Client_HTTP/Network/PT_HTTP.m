//
//  PT_HTTP.m
//  PT_Client_HTTP
//
//  Created by 天蓝 on 2017/7/26.
//  Copyright © 2017年 PT. All rights reserved.
//

#import "PT_HTTP.h"
#import <AFNetworking.h>

static PT_HTTP *_sharedPT_HTTP = nil;

@interface PT_HTTP ()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation PT_HTTP

+ (void)initialize
{
    [PT_HTTP sharedPT_HTTP];
}

+ (instancetype)sharedPT_HTTP
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedPT_HTTP = [[PT_HTTP alloc] init];
        _sharedPT_HTTP.manager = [AFHTTPSessionManager manager];
    });
    return _sharedPT_HTTP;
}

+ (void)POST:(NSString *)action
  parameters:(NSDictionary *)parameters
     success:(void (^)(NSDictionary * responseObject))success
{
    [self POST:action parameters:parameters success:success failure:nil];
}

+ (void)POST:(NSString *)action
  parameters:(NSDictionary *)parameters
     success:(void (^)(NSDictionary * responseObject))success
     failure:(void (^)(NSError *error))failure
{
    [self POST:action parameters:parameters success:success failure:failure timeoutInterval:20];
}

+ (void)POST:(NSString *)action
  parameters:(NSDictionary *)parameters
     success:(void (^)(NSDictionary * responseObject))success
     failure:(void (^)(NSError *error))failure
timeoutInterval:(CGFloat)timeoutInterval
{
    [self POST:action parameters:parameters progress:nil success:success failure:failure timeoutInterval:timeoutInterval];
}

+ (void)POST:(NSString *)action
  parameters:(NSDictionary *)parameters
    progress:(void (^)(NSProgress * _Nonnull))progress
     success:(void (^)(NSDictionary * responseObject))success
     failure:(void (^)(NSError *error))failure
timeoutInterval:(CGFloat)timeoutInterval
{
    _sharedPT_HTTP.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    _sharedPT_HTTP.manager.requestSerializer.timeoutInterval = timeoutInterval;
    _sharedPT_HTTP.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kServiceAddress,action];
    
    [_sharedPT_HTTP.manager POST:urlStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure(error);
    }];
}

@end
