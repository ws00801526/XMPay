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
    
    [XMPay payLocalWithArguments:@{XM_PAY_ORDER_ID_KEY:@"13131329321-wx",XM_PAY_ORDER_DESC_KEY:@"测试支付而已",XM_PAY_ORDER_NAME_KEY:@"测试支付标题",XM_PAY_ORDER_PRICE_KEY:@(1.1f)} payMethod:XMPayWithWX];
    
}

- (IBAction)payAli:(id)sender {
    
    [XMPay payLocalWithArguments:@{XM_PAY_ORDER_ID_KEY:@"13131329321-ali",XM_PAY_ORDER_DESC_KEY:@"测试支付而已",XM_PAY_ORDER_NAME_KEY:@"测试支付标题",XM_PAY_ORDER_PRICE_KEY:@(1.1f)} payMethod:XMPayWithALI];
}
@end
