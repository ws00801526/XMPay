//
//  XMPay.m
//  TourGuide
//
//  Created by shscce on 15/8/19.
//  Copyright (c) 2015年 allen. All rights reserved.
//

#import "XMPay.h"

#import <AlipaySDK/AlipaySDK.h>
#import "WXApi.h"
#import "XMAliOrder.h"
#import "XMWXOrder.h"
#import "XMPayUtil.h"
#import "XMPayDefines.h"

@implementation XMPay


#pragma mark - Public Methods

+ (void)payOnlineWithArguments:(NSDictionary *)arguments payMethod:(XMPayMethod)payMethod{
    switch (payMethod) {
        case XMPayWithWX:
        {
            PayReq* req = [[PayReq alloc] init];
            //必须要带有的两个参数
            req.prepayId = arguments[@"prepayID"];
            req.sign = arguments[@"sign"];
            
            //可以在客户端定义好与服务端同样的数据,推荐使用服务端数据
            req.openID = arguments[@"openID"];
            req.partnerId = arguments[@"partnerID"];
            req.nonceStr = arguments[@"nonceStr"];
            req.timeStamp = (UInt32)[arguments[@"timeStamp"] integerValue];
            
            req.package = arguments[@"package"];
            [WXApi sendReq:req];
        }
            break;
        case XMPayWithALI:
        {
            [[AlipaySDK defaultService] payOrder:arguments[@"orderString"] fromScheme:ALI_APP_SCHEME callback:^(NSDictionary *resultDic) {
                //TODO 处理支付回调结果
                NSLog(@"reslut = %@",resultDic);
                //发送通知,接受到回调的页面处理回调结果
                [[NSNotificationCenter defaultCenter] postNotificationName:XM_PAY_NOTIFICATION object:nil userInfo:resultDic];
            }];
        }
            break;
        default:
            break;
    }
}


+ (void)payLocalWithArguments:(NSDictionary *)arguments payMethod:(XMPayMethod)payMethod{
    switch (payMethod) {
        case XMPayWithALI:
            [XMPay aliLocalPay:arguments];
            break;
        case XMPayWithWX:
            [XMPay wxLocalPay:arguments];
            break;
        default:
            break;
    }
}

#pragma mark - Private Methods

/**
 *  使用支付宝本地签名进行支付
 *
 *  @param arguments  包括以下必须参数
 *  XM_PAY_ORDER_NAME_KEY  -- 订单名称
 *  XM_PAY_ORDER_ID_KEY    -- 订单id
 *  XM_PAY_ORDER_DESC_KEY  -- 订单描述
 *  XM_PAY_ORDER_PRICE_KEY -- 订单价格
 */
+ (void)aliLocalPay:(NSDictionary *)arguments{
    XMAliOrder *order = [[XMAliOrder alloc] init];
    order.tradeNO = arguments[XM_PAY_ORDER_ID_KEY];
    order.productName = arguments[XM_PAY_ORDER_NAME_KEY];
    order.productDescription = arguments[XM_PAY_ORDER_DESC_KEY];
    order.amount = [NSString stringWithFormat:@"%.2f",[arguments[XM_PAY_ORDER_PRICE_KEY] floatValue]];
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    
    NSString *signedString = [XMPayUtil rsa:orderSpec privateKey:ALI_PRIVATE_KEY];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:ALI_APP_SCHEME callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
            [[NSNotificationCenter defaultCenter] postNotificationName:XM_PAY_NOTIFICATION object:nil userInfo:resultDic];
        }];
    }
}


/**
 *  微信本地支付
 *  支付步骤  
 *  1.生成XMWXOrder
 *  2.设置XMWXOrder的body,totalFee,tradeNo字段
 *  3.调用XMWXOrder startPay 方法 进行支付
 *  @param arguments
 */
+ (void)wxLocalPay:(NSDictionary *)arguments{
    XMWXOrder *wxOrder= [[XMWXOrder alloc] init];
    wxOrder.body = arguments[XM_PAY_ORDER_NAME_KEY];
    
    //因为微信支付的单位是分 如果传入的是元的单位 进行*100处理 ,如果传入是分的单位则不进行处理
    wxOrder.totalFee = [NSString stringWithFormat:@"%.0f",[arguments[XM_PAY_ORDER_PRICE_KEY] floatValue] * 100];
    wxOrder.tradeNo = arguments[XM_PAY_ORDER_ID_KEY];
    [wxOrder startPay];
}

@end
