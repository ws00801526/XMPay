//
//  XMPayDefines.h
//  TourGuide
//
//  Created by shscce on 15/8/18.
//  Copyright (c) 2015年 allen. All rights reserved.
//

#ifndef TourGuide_XMPayDefines_h
#define TourGuide_XMPayDefines_h

#import <UIKit/UIKit.h>


/**
 *  支付结果状态
 */
typedef NS_ENUM(NSUInteger, XMPayResult){
    XMPaySuccess /**< 支付成功 */,
    XMPayFailed /**< 支付失败 */,
    XMPayCancel /**< 支付取消 */,
};

/**
 *  支付方式
 */
typedef NS_ENUM(NSUInteger, XMPayMethod){
    XMPayWithWX /**< 微信支付 */,
    XMPayWithALI /**< 支付宝支付 */,
    XMPayWithSINA /**< 新浪支付 */,
};


#define XM_PAY_NOTIFICATION @"XM_PAY_NOTIFICATION"

/**
 *  订单id 的key
 */
#define XM_PAY_ORDER_ID_KEY @"XM_PAY_ORDER_ID_KEY"

/**
 *  订单标题 的key
 */
#define XM_PAY_ORDER_NAME_KEY @"XM_PAY_ORDER_NAME_KEY"

/**
 *  订单描述 的key
 */
#define XM_PAY_ORDER_DESC_KEY @"XM_PAY_ORDER_DESC_KEY"

/**
 *  订单价格 的key
 */
#define XM_PAY_ORDER_PRICE_KEY @"XM_PAY_ORDER_PRICE_KEY"

#pragma mark - 微信支付 APPID等相关定义

#define WX_APP_ID          @"" //微信支付APPID
#define WX_APP_SECRET      @"" //微信支付appsecret
#define WX_MCH_ID          @"" //微信支付  商户号，填写商户对应参数
#define WX_PARTNER_KEY     @"" //微信支付 商户API密钥，填写相应参数

//支付结果回调页面
#define WX_NOTIFY_URL      @""

#pragma mark - 支付宝支付 相关定义

#define ALI_PARTNER     @""     //支付宝partner
#define ALI_SELLER      @""     //支付宝seller
#define ALI_PRIVATE_KEY @""     //支付宝私钥加密
#define ALI_APP_SCHEME @""      //支付宝回调应用配置,需要在infoscheme中配置相同字符串
#define ALI_NOTIFY_URL @""      //支付宝回调地址

#endif
