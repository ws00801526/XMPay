//
//  XMWXOrder.m
//  TourGuide
//
//  Created by shscce on 15/8/19.
//  Copyright (c) 2015年 allen. All rights reserved.
//


/*微信本地签名支付 具体步骤如下
    1.配置各种参数,appid,回调地址,随机字符串,交易烈性,mchID,appIP等等
    2.对配置好的参数生成一个MD5加密的字符串 sign
    3.配置好的参数加上 MD5加密字符串sign  生成一个xmlString
    4.使用xmlString 请求微信服务器 获取预支付id  prepayId
    5.配置PayReq请求参数,其中PayReq的sign参数是对prepayID,mch_id,package,nonceStr,timeStamp,partner_id重新MD5加密
    6.使用WXApi 请求微信支付
 */

#import "XMWXOrder.h"
#import "XMPayDefines.h"
#import "XMPayUtil.h"
#import "XMLDictionary.h"

#import "WXApi.h"

@implementation XMWXOrder

- (instancetype)init{
    if ([super init]) {
        self.appID = WX_APP_ID;
        self.appIP = [XMPayUtil IPAddress];
        self.partnerKey = WX_PARTNER_KEY;
        self.mchID = WX_MCH_ID;
        self.notifyUrl = WX_NOTIFY_URL;
        self.tradeType = @"APP";
        self.nonceStr = [XMPayUtil generateRandomStr:10];
    }
    return self;
}

#pragma mark - Public Methods

- (void)startPay{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://api.mch.weixin.qq.com/pay/unifiedorder"] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5];
    //设置提交方式
    [request setHTTPMethod:@"POST"];
    //设置数据类型
    [request addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    //设置编码
    [request setValue:@"UTF-8" forHTTPHeaderField:@"charset"];
    //如果是POST
    [request setHTTPBody:[self.signXMLStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSError *error;
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    NSDictionary *dict = [NSDictionary dictionaryWithXMLString:[[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]];
    if ([dict[@"result_code"] isEqualToString:@"SUCCESS"] && [dict[@"return_code"] isEqualToString:@"SUCCESS"]) {
        //发起微信支付，设置参数
        PayReq *request = [[PayReq alloc] init];
        request.partnerId = dict[@"mch_id"];
        request.prepayId = dict[@"prepay_id"];
        request.package = @"Sign=WXPay";
        request.nonceStr= dict[@"nonce_str"];
        //将当前事件转化成时间戳
        NSDate *datenow = [NSDate date];
        NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
        UInt32 timeStamp =[timeSp intValue];
        request.timeStamp= timeStamp;
        request.sign = [self md5StrForDict:@{@"appid":WX_APP_ID,@"partnerid":request.partnerId,@"noncestr":request.nonceStr,@"prepayid":request.prepayId,@"package":request.package,@"timestamp":[NSString stringWithFormat:@"%u",(unsigned int)request.timeStamp]}];
        NSLog(@"%d",[WXApi sendReq:request]);
    }
}

- (NSString *)md5StrForDict:(NSDictionary *)dict{
    NSMutableString *contentString  =[NSMutableString string];
    NSArray *keys = [dict allKeys];
    //按字母顺序排序
    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    //拼接字符串
    for (NSString *key in sortedArray) {
        if (dict[key]) {
            [contentString appendFormat:@"%@=%@&", key, dict[key]];
        }
    }
    //添加商户密钥key字段
    [contentString appendFormat:@"key=%@", WX_PARTNER_KEY];
    NSString *result = [XMPayUtil md5:contentString];
    return result;
}


#pragma mark - Getters

- (NSDictionary *)dict{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:self.appID forKey:@"appid"];
    [dict setValue:self.mchID forKey:@"mch_id"];
    [dict setValue:self.nonceStr forKey:@"nonce_str"];
    [dict setValue:self.body forKey:@"body"];
    [dict setValue:self.tradeNo forKey:@"out_trade_no"];
    [dict setValue:self.totalFee forKey:@"total_fee"];
    [dict setValue:self.appIP forKey:@"spbill_create_ip"];
    [dict setValue:self.notifyUrl forKey:@"notify_url"];
    [dict setValue:self.tradeType forKey:@"trade_type"];
    return dict;
}

- (NSString *)signStr{
    return [self md5StrForDict:self.dict];
}

- (NSString *)signXMLStr{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.dict];
    dict[@"sign"] = self.signStr;
    return [dict XMLString];
}

@end
