//
//  NSString+dealString.m
//  jiuDiaoSi
//
//  Created by zhoulei on 13-8-4.
//  Copyright (c) 2013年 zhoulei. All rights reserved.
//

#import "NSString+dealString.h"

@implementation NSString (dealString)
-(NSString *)dealWithDecimalNum:(NSInteger)num;
{
    NSString *str=self;
    NSRange rang=[str rangeOfString:@"."];
    if (num==0) {
        if (rang.length>0) {
            str=[str substringToIndex:rang.location];//取小数点前面位 
        }
    }
    else
    {
    
        if (rang.length>0) {
            str=[str substringToIndex:rang.location+num+1];//取小数点后num位
        }
        else
        {
        
           str=[str stringByAppendingString:@".0"];//自动补全小数点后一位
        }
    
    }
//    if (rang.length>0) {
//        if (num==0) {
//            str=[str substringToIndex:rang.location];//取小数点前面位
//
//        }
//        else
//        {
//            str=[str substringToIndex:rang.location+num+1];//取小数点后num位
//
//        }
//    }
//    else
//    {
//        str=[str stringByAppendingString:@".0"];//自动补全小数点后一位
//    }
    return str ;
}
-(NSString *)dealWithCurrentTimeWithLength:(NSInteger)length
{
    NSString *str=self;
    //获取到的时间
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //    NSDate *fireDate = [dateFormatter dateFromString:self];
//    [dateFormatter release];

//目标时间
//    NSDate *date=[NSDate date];
    
    //截取出开抢时间
    NSRange range=[str rangeOfString:@" "];
    if (range.length>0) {
        str=[str substringToIndex:range.location+length];
        str=[str substringFromIndex:range.location+1];
    }
    return str;
}
+(NSString *)dealWithDiscoutStrWithOldPrice:(NSString *)oldPrice withNowPrice:(NSString *)nowPrice
{
    float discout=[oldPrice floatValue]/[nowPrice floatValue];
    NSString *discountStr=[NSString stringWithFormat:@"%f",discout];
    discountStr=[discountStr dealWithDecimalNum:1];
    return discountStr;
}
+(NSString *)dealWithAMOrPMWithHourTimeStr:(NSString *)hourtime
{
    if ([hourtime integerValue]>=0&&[hourtime integerValue]<=12) {
        return [NSString stringWithFormat:@"上午 %@点",hourtime];
    }
    else
    {
        hourtime=[NSString stringWithFormat:@"%ld",[hourtime integerValue]-12];
        return [NSString stringWithFormat:@"下午 %@点",hourtime];
    }
    return nil;
}

//格式化日期


//
//+(BOOL)dealWithIsNewMessageRead{
//    NSDate *date=(NSDate*)[[NSUserDefaults standardUserDefaults]objectForKey:HuoDongkey];
//    BOOL messageIsread=[self dealWithIsTodayWithDate:date];
//    return messageIsread;
//    
//}
+(BOOL)dealWithIsTodayWithDate:(NSDate*)dateTime{
    
    NSCalendar *calendar = [ NSCalendar currentCalendar ];
    
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear ;
    
    
    // 1. 获得当前时间的年月日
    
    NSDateComponents *nowCmps = [calendar components :unit fromDate :[ NSDate date ]];
    
    
    
    // 2. 获得 self 的年月日
    if (!dateTime) return NO;
    NSDateComponents *selfCmps = [calendar components :unit fromDate : dateTime ];
    
    
    return
    
    (selfCmps. year == nowCmps. year ) &&      //直接分别用当前对象和现在的时间进行比较，比较的属性就是年月日
    
    (selfCmps. month == nowCmps. month ) &&
    
    (selfCmps. day == nowCmps. day );
}

@end
