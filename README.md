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
![](/content/images/2015/08/CB80212C-0C26-468A-B6A0-9BEFA192867E.png)
2.添加支持类库 
![](/content/images/2015/08/099555C5-DE1C-4CC0-94F5-B8F4AC94FE35.png)
3.参考 AppDelegate+XMPay配置回调
4.在XMPayDefines.h 中配置微信支付,支付宝支付相关参数定义
5.是用XMPay 唤起支付


####3.相关问题
1.相关openssl头文件找不到,需要在Build settings - Header Search Path 中配置相关搜索路径,一下截图可以参考下
![](/content/images/2015/08/D6E19749-AAE5-40B7-9ACF-9A5CF675C8AC.png)