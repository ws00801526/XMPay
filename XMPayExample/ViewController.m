//
//  ViewController.m
//  XMPayExample
//
//  Created by shscce on 15/8/19.
//  Copyright (c) 2015年 xmfraker. All rights reserved.
//

#import "ViewController.h"

#import "XMPay.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *payTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *payPriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *payDescTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)payWx:(id)sender {
    
    if (self.payPriceTextField.text.length == 0 || self.payDescTextField.text.length == 0 || self.payTitleTextField.text.length == 0) {
        NSLog(@"请输入完整的支付参数");
        return;
    }
    
    NSString *randomStr = [self radomString:18];
    [XMPay payLocalWithArguments:@{XM_PAY_ORDER_ID_KEY:randomStr,XM_PAY_ORDER_DESC_KEY:self.payDescTextField.text,XM_PAY_ORDER_NAME_KEY:self.payTitleTextField.text,XM_PAY_ORDER_PRICE_KEY:@([self.payPriceTextField.text floatValue])} payMethod:XMPayWithWX];
    
}

- (IBAction)payAli:(id)sender {
    
    if (self.payPriceTextField.text.length == 0 || self.payDescTextField.text.length == 0 || self.payTitleTextField.text.length == 0) {
        NSLog(@"请输入完整的支付参数");
        return;
    }
    
    NSString *randomStr = [self radomString:18];

    [XMPay payLocalWithArguments:@{XM_PAY_ORDER_ID_KEY:randomStr,XM_PAY_ORDER_DESC_KEY:self.payDescTextField.text,XM_PAY_ORDER_NAME_KEY:self.payTitleTextField.text,XM_PAY_ORDER_PRICE_KEY:@([self.payPriceTextField.text floatValue])} payMethod:XMPayWithALI];

}

/**
 *  随机生成指定长度字符串
 *
 *  @param length 字符串长度
 *
 *  @return 生成的指定长度的字符串
 */
- (NSString *)radomString:(NSUInteger)length {
    char data[length];
    for (int x=0;x<length;data[x++] = (char)('A' + (arc4random() % (26))));
    return [[[NSString alloc] initWithBytes:data length:length encoding:NSUTF8StringEncoding] uppercaseString];
}

@end
