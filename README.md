# XMPay
支付宝,微信支付集成

######微信 支付宝  XMPay

一个比较简单的将微信,支付宝支付集成到一起的demo
微信版本:1.5
支付宝版本:2.2.1

####1. 工程目录

```
project_dir
  XMPay 
    Vendors   -- 微信sdk,支付宝sdk,openssl
    XMPayDefines.h  -- 相关支付宝,微信的定义 
    XMPay.h 
    XMPay.m
    XMAliOrder.h
    XMAliOrder.m
    XMWXOrder.h
    XMWXOrder.m
    XMPayUtil.h    -- MD5加密,RSA加密,获取IP地址等
    XMPayUtil.m
```

####2.集成步骤

1. 导入XMPay目录至工程文件内
![](http://7xlt1j.com1.z0.glb.clouddn.com/XMPay-1.png)
2.添加支持类库 
![](http://7xlt1j.com1.z0.glb.clouddn.com/XMPay-2.png)
3.参考 AppDelegate+XMPay配置回调
4.在XMPayDefines.h 中配置微信支付,支付宝支付相关参数定义
5.是用XMPay 唤起支付


####3.相关问题
1.相关openssl头文件找不到,需要在Build settings - Header Search Path 中配置相关搜索路径,一下截图可以参考下
![](http://7xlt1j.com1.z0.glb.clouddn.com/XMPay-3.png)

2.无法打开cannotOpenUrl(safepay,alipay,weixin)
![](http://7xlt1j.com1.z0.glb.clouddn.com/XMPay-4.png)

3.无法调起微信支付
* appdelegate 中没有注册WX