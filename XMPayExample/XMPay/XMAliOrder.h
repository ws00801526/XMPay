//
//  XMAliOrder.h
//  TourGuide
//
//  Created by shscce on 15/8/19.
//  Copyright (c) 2015年 allen. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  支付宝支付需要的订单
 */
@interface XMAliOrder : NSObject

@property(nonatomic, copy) NSString * partner; /**< 支付宝提供的partner编号 */
@property(nonatomic, copy) NSString * seller; /**< 支付宝提供的seller编号 */
@property(nonatomic, copy) NSString * tradeNO; /**< 订单编号 */
@property(nonatomic, copy) NSString * productName; /**< 订单标题 */
@property(nonatomic, copy) NSString * productDescription; /**< 订单描述 */
@property(nonatomic, copy) NSString * amount; /**< 金额 单位元 */
@property(nonatomic, copy) NSString * notifyURL; /**< 回调地址,必须 */

@property(nonatomic, copy) NSString * service; /**< 支付类型 */
@property(nonatomic, copy) NSString * paymentType; /**< 支付方式 */
@property(nonatomic, copy) NSString * inputCharset; /**< 编码方式 */
@property(nonatomic, copy) NSString * itBPay; /**< 过期时间 */
@property(nonatomic, copy) NSString * showUrl; /**< shouurl */

@property(nonatomic, copy) NSString * rsaDate; /**< rsa签名日期  可选 */
@property(nonatomic, copy) NSString * appID; /**< 应用appid  可选 */

@property(nonatomic, readonly) NSMutableDictionary * extraParams; /**< 可选 -- 其他自定义参数类型 */

@end
