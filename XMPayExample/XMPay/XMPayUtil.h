//
//  XMPayUtil.h
//  TourGuide
//
//  Created by shscce on 15/8/18.
//  Copyright (c) 2015年 allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMPayUtil : NSObject


#pragma mark - 加密相关实现

/**
 *  需要MD5加密的字符串
 *
 *  @param str 需要加密的字符串
 *
 *  @return 加密后的字符串
 */
+ (NSString *)md5:(NSString *)str;

/**
 *  实现SHA1加密
 *
 *  @param str 需要加密的字符串
 *
 *  @return 加密后的字符串
 */
+ (NSString*)sha1:(NSString *)str;

/**
 *  实现RSA加密
 *
 *  @param str        需要加密的字符串
 *  @param privateKey 加密用的privateKey
 *
 *  @return 加密后的字符串
 */
+ (NSString *)rsa:(NSString *)str privateKey:(NSString *)privateKey;

/**
 *  验证RSA加密
 *
 *  @param originStr 加密之前字符串
 *  @param signStr   加密后字符串
 *  @param publicKey 验证公钥
 *
 *  @return 是否正确
 */
+ (BOOL)verifyRSA:(NSString *)originStr signStr:(NSString *)signStr publicKey:(NSString *)publicKey;

/**
 *  获取本机IP地址
 *
 *  @return 本机IP地址
 */
+ (NSString *)IPAddress;

/**
 *  生成指定长度的随机字符串
 *
 *  @param length 随机字符串长度
 *
 *  @return 生成的随机字符串
 */
+ (NSString *)generateRandomStr:(NSUInteger)length;

/**
 * 实现http GET/POST
 */
+ (NSData *)httpSend:(NSString *)url method:(NSString *)method data:(NSString *)data;

@end
