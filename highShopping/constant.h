//
//  constant.h
//  jiuyuebing
//
//  Created by zhoulei on 13-12-5.
//  Copyright (c) 2013年 zhoulei. All rights reserved.
//

#ifndef constant_h
#define constant_h

#define UMENG_CHANNEL @"appstore"   // ,weiphone
//#define UMENG_CHANNEL @"tongbutui"
//#define UMENG_CHANNEL @"91"
//#define UMENG_CHANNEL @"weiphone"
//#define UMENG_CHANNEL @"pp"
#define DEVICE_Token @"deviceToken"
//#define   appStoreUrl  @"https://itunes.apple.com/cn/app/jiu-kuai-jiu-miao-sha-9kuai9bao/id893540090?mt=8"  //九块九包邮（bate)appStore下载地址
//
#define RP_APPKEY @"100089"  //门禁的appkey
#define RP_APPSECRET @"d8e4486e55435a2bf680301fe0f5e835" //门禁的appsercet ，用服务器自定义
#define ACCESS_TOKEN  @"access_token"


//#define UM_APPKEY @"54b7611efd98c5b50a00010c"   //企业包
#define UM_APPKEY @"56837d32e0f55a4ab6002715"  //考拉友盟key
#define WX_APPID @"wx835a1f954e43d51f" //快递侠
#define WX_APPSECRET @"5cac2678371758fe5d5bfe44677bf42a" //快递侠



#define huanxinID @"huanxin_user"
#define huanxinPassWord  @"huanxin_pass"
#define HUANXIN_LOGED  @"huanxinLog"

#define REMOTE_NOTICE  @"noticeDictionary"

#define FOREGROUND  @"foreground"

//快递侠
//AppID：wx835a1f954e43d51f
//AppSecret：5cac2678371758fe5d5bfe44677bf42a

#define QQ_APPID @"1103423569"
#define QQ_KEY @"c1HcurlPh3xfea90"

#define WB_APPKEY @"258264072"
#define WB_REDIRECTURL @"https://api.weibo.com/oauth2/default.html"
#define SHARE_WEB_URL @"https://itunes.apple.com/us/app/xiao-yuan-wei-dian/id916536264?l=zh&ls=1&mt=8"

#define currentAddress @"currentAddress"
#define USER_INFO @"userInfo"
#define House_INFO  @"userHouseInfo"
#define SIGN_INFO @"signInfo"

//下载及评分
#define Download_ID  @"916536264"
#define Download_URL @"https://itunes.apple.com/us/app/xiao-yuan-wei-dian/id916536264?l=zh&ls=1&mt=8"
#define Comment_URL  @"tms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d"


//公用接口
#define moreAppWebUrl @"http://cloud.yijia.com/yunying/applist.php?"
#define alerturl  @"http://cloud.yijia.com/load_alert/alert_api.php?" //开机弹窗地址

//#define totalBackGroundColor   [appInfo colorInfo]
#define totalThemeColor    [UIColor colorWithRed:115.0/255.0 green:200.0/255.0 blue:71.0/255.0 alpha:1]
#define totalNavigationColor    [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1]
#define  totalThemeTextColor    [UIColor colorWithRed:232.0/255.0 green:54.0/255.0 blue:119.0/255.0 alpha:1]
#define totalTableviewColor    [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:249.0/255.0 alpha:1]

#define  viewBorderColor [[UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0] CGColor];

#define  purpleStatusLableColor  [UIColor colorWithRed:110.0/255.0 green:138.0/255.0 blue:205.0/255.0 alpha:1] //字体紫色
#define  purpleStatusViewColor   [UIColor colorWithRed:211.0/255.0 green:221.0/255.0 blue:245.0/255.0 alpha:1] //状态淡紫色
#define  redStatusLableColor  [UIColor colorWithRed:184.0/255.0 green:63.0/255.0 blue:62.0/255.0 alpha:1] //字体红色色
#define  redStatusViewColor   [UIColor colorWithRed:236.0/255.0 green:156.0/255.0 blue:158.0/255.0 alpha:1] //状态淡红色

#define KeyBoard_Number_Height 216.0f
#define KeyBoard_Height 252.0f



#define PROVINCE_COMPONENT  0
#define CITY_COMPONENT      1
#define DISTRICT_COMPONENT  2

#define IMAGE_VARITY_SCALE 0.4

#endif
