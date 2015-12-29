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

#define WX_APP_ID          @"wx861a6c2237d28f04" //微信支付APPID
#define WX_APP_SECRET      @"05555789e37891091c1323437e3056a3" //微信支付appsecret
#define WX_MCH_ID          @"1247584201" //微信支付  商户号，填写商户对应参数
#define WX_PARTNER_KEY     @"17ef16cf1ca445c08cbabc4022c17a11" //微信支付 商户API密钥，填写相应参数

//支付结果回调页面
#define WX_NOTIFY_URL      @"http://101.200.203.151:80/user/weixin_notify/"

#pragma mark - 支付宝支付 相关定义

#define ALI_PARTNER     @"2088911914612020"     //支付宝partner
#define ALI_SELLER      @"finance@bolinkdata.com"     //支付宝seller
#define ALI_PRIVATE_KEY @"MIICXgIBAAKBgQC59El1rHusq9Y2kq6lBKJhqkfbWETxOduvurjkmIu1LyMIUagmqUF1PeRJftII3e+uLGnuTQnCemP7zJJziijiGH0sbJ4XBbJbA3fDXIGgta5IuqF9j28xQBV7CNpU1K9YFfFc+AA4JrwnyjQ9luuJuOGzX9kgAuv3/8lLALN94QIDAQABAoGAZmpsFxpzVyuhJJdvBsXhpUbCosUf23gRTdzaPlTiBV07vzYyFXD881SuKehmR6nsexJNGYlmia0c6i7Grkn2r3bZJd2Ec+5zR+YafDCdQgNsEpwGwvBiIt1YyXuisUKv1I2M8wj3BFxHMi2tTXasIQuVB6806NxY9FOUAOqv4UECQQDr6/oBJfGS9G5w1gQdekLnSXJrWsvDAl06lJu9S0BHJVSreUTDEFBxLi3PpI42VGBn3xpYi0Of1WUdRzxsrIapAkEAycerJ/C8Lv5rfQwEdc6ohRCkokL6dYdPOFZKbDt50o/I7BYPL5T+E5a2CNW4smd1vwM9xN2PNn/l7QYSP0gYeQJBAKWkc03nFCv3zqsOuKjxtJOrb9iMUVBEEq0Uthw7/490WHRkmrDSfYhZwfRuNyNSLrX/YQIWFY7dRzc9UuGCaLECQQDJad+1LJ4LoraUycwh9DlPKf/MYGM1se0n5SrAwtWlkxUSZCqgam78CrKGOx/0JUXpd0jPHAH6esx+PlM0i7ixAkEAzsI3lB+WFxLcnMg4mNC27T3Wh8QhP56DkZll/KKwZpGaBZ0S1nDoP2x/Fe3igFQzyVtDEckU9qsMKE+YsExnlA=="     //支付宝私钥加密
#define ALI_APP_SCHEME @"com.XMFraker.XMALIPay"      //支付宝回调应用配置,需要在infoscheme中配置相同字符串
#define ALI_NOTIFY_URL @"http://101.200.203.151:80/user/alipay_notify/"      //支付宝回调地址

#endif
