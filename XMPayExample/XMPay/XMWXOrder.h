//
//  XMWXOrder.h
//  TourGuide
//
//  Created by shscce on 15/8/19.
//  Copyright (c) 2015年 allen. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  微信支付需要产生的订单
 */
@interface XMWXOrder : NSObject

//初始化的时候会自己生成的
@property (nonatomic,copy) NSString *appID; /**< 应用id */
@property (nonatomic,copy) NSString *mchID; /**< 商户id */
@property (nonatomic,copy) NSString *nonceStr; /**< 随机字符串 */
@property (nonatomic,copy) NSString *partnerKey; /**< 合作商户密钥 */
@property (nonatomic,copy) NSString *appIP; /**< ip地址 */
@property (nonatomic,copy) NSString *notifyUrl; /**< 回调地址 */
@property (nonatomic,copy) NSString *tradeType; /**< 支付类型标志 */

//需要用户自己制定
@property (nonatomic,copy) NSString *body; /**< 订单描述 */
@property (nonatomic,copy) NSString *tradeNo; /**< 订单编号 */
@property (nonatomic,copy) NSString *totalFee; /**< 订单总金额 单位是分 需要注意 */


@property (copy, nonatomic, readonly) NSDictionary *dict; /**< 签名时需要的Dict */

@property (copy, nonatomic, readonly) NSString *signStr; /**< 生成的MD5签名字符串 */

@property (copy, nonatomic, readonly) NSString *signXMLStr; /**< 增加sign 的xml类型字符串 */

/**
 *  从order调用支付
 */
- (void)startPay;

@end
