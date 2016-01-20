//
//  VendorMacro.h
//  九元
//
//  Created by zhoulei on 14-3-5.
//  Copyright (c) 2014年 zhoulei. All rights reserved.
//

#ifndef ___VendorMacro_h
#define ___VendorMacro_h


#define gqAdUrl  @"http://www.52ivt.com/lunbo.php?"

#define cateUrlString   @"http://www.52ivt.com/menu.php?"

#define mainViewDataUrlString  @"http://www.52ivt.com/api.php?"

/*http://www.52ivt.com/api.php?sprice=1&cid=1170131109&page=1&limit=5&eprice=300





新版本首页接口：

sprice:起始价格 默认空

eprice:结束价格 默认空

cid:商品分类 默认空

page:商品页数 默认1

limit:每页多少 默认10
*/



#define abuoutUsUrlStirng  @"http://www.52ivt.com/about.html"


#define taobaoChart @"https://h5.m.taobao.com/mlapp/cart.html"

#define taobaoOrders  @"https://h5.m.taobao.com/mlapp/olist.html"
#define taobaoSaved  @"https://h5.m.taobao.com/fav/index.htm"
#define taobaoRecords  @"https://h5.m.taobao.com/footprint/waphome.html"


#define adUrl @"http://wd.wotaotao.com/express/banner_api/appkey/100042"
//http://wd.wotaotao.com/express/banner_api/appkey/100042/sid/123456/access_token/wdat_f19273f33095668107ecd1a10d09d74a/



#define logAndRegisterUrl  @"http://guardapi.repaiapp.com/userApp/login/"
// http://guardapi.repaiapp.com/user/reg_login_api/appkey/密钥编号/phone/十一位手机号/password/六位数字登陆密码/appoid/手机设备唯一编号/timestamp/1402307990/token/73191b75734ea67df90cbb824ff67811/appversion/应用版本号/osversion/系统版本号/network/网络类型 /screenwidth/手机屏幕分辨率宽度/screenheight/手机屏幕分辨率高度/phonetype/手机类型"


#define resetPassWordUrl @"http://guardapi.repaiapp.com/appuser/resetpass_newpass_api"
//      http://guardapi.repaiapp.com/user/resetpass_newpass_api/appkey/密钥编号/phone/十一位手机号/password/六位数字登陆密码/appoid/手机设备唯一编号/timestamp/1402307990/token/73191b75734ea67df90cbb824ff67811/appversion/应用版本号/osversion/系统版本号/network/网络类型/screenwidth/手机屏幕分辨率宽度/screenheight/手机屏幕分辨率高度/phonetype/手机类型/authcode/短信验证码


#define  userInfoUrl  @"http://guardapi.repaiapp.com/userApp/userInfo"

//http://guardapi.repaiapp.com/appAuth/userinfo/phone/18234040219

#define locationUrl @"http://wd.wotaotao.com.cn/map/siteV2/type/school/"
//http://wd.wotaotao.com/map/siteV2/lat/31.26046752929688/lng/120.7557144165039/access_token/wdat_163584ff6369827ca56fee48a2444d1d/type/school/version/1.3.2/app_channel/appstore



#define qiandaoUrl @"http://wd.wotaotao.com/signin/signin_put_api/appkey/100042/"
//http://wd.wotaotao.com/signin/signin_put_api/appkey/100042/timestamp/1428646672/token/39978fca9ffa7d0f64230f81488da977/access_token/wdat_356da2694da75554958cc624aa9db5dd
#define jifenGuiZe @"http://wd.wotaotao.com/activity/jifeng"

#define userOrderUrl @"http://wd.wotaotao.com/exorder/user_order_list_api/access_token/"
//用户订单列表  http://wd.wotaotao.com/exorder/user_order_list_api/access_token/wdat_f19273f33095668107ecd1a10d09d74a/type/0/page/1  type 0取快递订单 1发快递订单


#define serviceRuleUrlString @"http://wd.wotaotao.com/wotaotaomessage/wotaotao" //服务协议


#define outLoginUrlString @"http://guardapi.repaiapp.com/userApp/logout"
//退出登录  http://guardapi.repaiapp.com/user/login_out_api/appkey/100088/appoid/73191b75734ea67df90cbb824ff67811/access_token/guard_91c8887023e977708e6cb6a16f711ba5/token/55ca4191ca324f76a12f8de53a803ab0  token =  md5("RP".$appkey.$appsecret.$appoid.$access_token);

//快递员 接口


#define beingCatchOrderUrl  @"http://wd.wotaotao.com/exorder/need_order_list_api/access_token/"
//http://wd.wotaotao.com/exorder/need_order_list_api/access_token/wdat_4236a82564b43ddf743ba815b935e23b/page/1  抢订单列表
#define catchOrderUrl  @"http://wd.wotaotao.com/exorder/grab_order/access_token/"
//http://wd.wotaotao.com/exorder/grab_order/access_token/wdat_b9c758dbbe30d1b4b71183ed39faf9ff/order_id/142908493131913  抢订单接口

#define courierOrderUrl @"http://wd.wotaotao.com/exorder/express_order_list_api/access_token/"
//快递侠订单管理接口 http://wd.wotaotao.com/exorder/express_order_list_api/access_token/wdat_b9c758dbbe30d1b4b71183ed39faf9ff/type/1
#define courierRemainUrl @"http://wd.wotaotao.com/express/wallet_api/access_token/"
///快递侠账户余额  http://wd.wotaotao.com/express/wallet_api/access_token/wdat_b9c758dbbe30d1b4b71183ed39faf9ff/
#define courierTradeListUrl @"http://wd.wotaotao.com/express/wallet_list_api/access_token/"
//快递侠收支列表  http://wd.wotaotao.com/express/wallet_list_api/access_token/wdat_b9c758dbbe30d1b4b71183ed39faf9ff/page/1
#define getAccountMoney @"http://wd.wotaotao.com/express/withdraw_api/appkey/100042/"
////提现接口  http://wd.wotaotao.com/express/withdraw_api/appkey/100042/timestamp/1429182068/token/fc7d8dce3a68988ed09c778fb28cf20d/access_token/wdat_b9c758dbbe30d1b4b71183ed39faf9ff/alipay_id/609761861@qq.com/money/2


#define startGetOrders @"http://wd.wotaotao.com/express/start_server_api/access_token/"
//http://wd.wotaotao.com/express/start_server_api/access_token/wdat_b9c758dbbe30d1b4b71183ed39faf9ff/
#define stopGetOrders @"http://wd.wotaotao.com/express/stop_server_api/access_token/"
//http://wd.wotaotao.com/express/stop_server_api/access_token/wdat_b9c758dbbe30d1b4b71183ed39faf9ff/


#define courierInfoUrl   @"http://wd.wotaotao.com/express/courier_info_api/access_token/"
//http://wd.wotaotao.com/express/courier_info_api/access_token/wdat_8545ae78ff919a85b5ee37af99f86121/


#define  contactUsUrl  @"http://wd.wotaotao.com/wotaotaomessage/link"
#define  aboutUsUrl @"http://wd.wotaotao.com/wotaotaomessage/about"
#define  weiboHomeUrl @"http://weibo.com/u/5296926397"


#define  KNOTIFICATION_CALLING  @"nocitice_calling"
#endif
