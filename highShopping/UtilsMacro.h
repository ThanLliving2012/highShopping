//
//  UtilsMacro.h
//  九元
//
//  Created by zhoulei on 14-3-12.
//  Copyright (c) 2014年 zhoulei. All rights reserved.
//

#ifndef ___UtilsMacro_h
#define ___UtilsMacro_h

#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


#define UIColorFromRGB(r,g,b) [UIColor colorWithRed:r/255.0  green:g/255.0 blue:b/255.0 alpha:1.0] //使用RGB
#define is_LandScreen  (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))

#define isWidthGreater  ([UIScreen mainScreen].bounds.size.width>[UIScreen mainScreen].bounds.size.width)
#define big  ([UIScreen mainScreen].bounds.size.width>[UIScreen mainScreen].bounds.size.height?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height)
#define small     ([UIScreen mainScreen].bounds.size.width<[UIScreen mainScreen].bounds.size.height?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height)


#define Rotation_Screen_Width     (is_LandScreen?big:small)

#define Rotation_Screen_Height  (is_LandScreen?small:big)


#define screenGreatThan4s (Rotation_Screen_Height>500)
#define IOS_VERSION_7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)? (YES):(NO))
#define IOS_VERSION_8_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

#define NavtionBar_Height IOS_VERSION_7_OR_ABOVE==YES?64:44

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define networkStatuWWAN  @"_180x180.jpg"

#define netWorkStatuWiFi  @"_300x300.jpg"

#define TableViewType  @"tableViewType"


#define adHeight Rotation_Screen_Width*(327/640.0)

#define DEMAND_CACH_DIRTECTORY   @"/demand_cachData"  //按需缓存的目录地址


#define SCREEN_SIZE_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_SIZE_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define OS_VERSION [[UIDevice currentDevice] systemVersion]
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define BUILD_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define PHONE_TYPE [[UIDevice currentDevice] model]


#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"


#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )


#define NETWORK_FAIL_MESSAGE  @"网络连接失败，请连网后再试!" //未连接网络
#define SERVER_FAIL_MESSAGE   @"服务器开小差了，请稍候再试!"  //服务器出现问题

#define FIRST_OPNE  @"firstopen" //首次打开 App

#define PLACE_HOLDER_IMAGENAME  @"default_user_head"


#define IPHONE_IMAGE_SIZE @"_200x200.jpg"
#define IPAD_IMAGE_SIZE @"_300x300.jpg"



#endif
