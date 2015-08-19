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
    
    [XMPay payLocalWithArguments:@{@"":@"",@"":@"",@"":@""} payMethod:XMPayWithWX];
    
}

- (IBAction)payAli:(id)sender {
    
    [XMPay payLocalWithArguments:@{@"":@"",@"":@"",@"":@""} payMethod:XMPayWithALI];
}
@end
