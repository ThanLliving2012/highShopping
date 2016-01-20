//
//  NSString+dealString.h
//  jiuDiaoSi
//
//  Created by zhoulei on 13-8-4.
//  Copyright (c) 2013年 zhoulei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (dealString)
-(NSString *)dealWithDecimalNum:(NSInteger)num;
-(NSString *)dealWithCurrentTimeWithLength:(NSInteger)length;
+(NSString *)dealWithDiscoutStrWithOldPrice:(NSString *)oldPrice withNowPrice:(NSString *)nowPrice;

+(NSString *)dealWithAMOrPMWithHourTimeStr:(NSString *)hourtime;//判断上午和下午

+(BOOL)dealWithIsTodayWithDate:(NSDate*)dateTime;

//+(BOOL)dealWithIsNewMessageRead;
@end
