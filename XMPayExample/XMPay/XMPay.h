//
//  XMPay.h
//  TourGuide
//
//  Created by shscce on 15/8/19.
//  Copyright (c) 2015年 allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMPayDefines.h"

@interface XMPay : NSObject

/**
 *  使用后台生成签名字符串进行支付
 *
 *  @param arguments  
 *  微信支付对应arguments参数
 *              微信支付                   支付宝支付
 *  @param  openID -- 微信支付id        orderString--符合规则的支付凭据
 *  @param  partnerID -- 商户id
 *  @param  prepayID -- 预支付id
 *  @param  timeStamp -- 时间戳
 *  @param  nonceStr -- 随机字符串
 *  @param  package --
 *  @param  sign -- 签名字符串
 *
 *
 *  @param payWay    支付方式 微信,支付宝,新浪钱包等
 */
+ (void)payOnlineWithArguments:(NSDictionary *)arguments payMethod:(XMPayMethod)payMethod;


/**
 *  本地加密进行支付
 *
 *  @param arguments 传入的支付字符串
 *  @param payMethod 支付方式
 */
+ (void)payLocalWithArguments:(NSDictionary *)arguments payMethod:(XMPayMethod)payMethod;

@end
