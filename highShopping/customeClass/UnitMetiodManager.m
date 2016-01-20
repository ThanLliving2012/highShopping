//
//  UnitMetiodManager.m
//  mxrepai
//
//  Created by ZHONG on 14-7-22.
//  Copyright (c) 2014年 ZHONG. All rights reserved.
//

#import "UnitMetiodManager.h"

@implementation UnitMetiodManager


//把返回字段转换成string类型  防止crash
+ (NSString *)exchangeTheReturnValueToString:(id)value
{
    if (value == nil)
    {
        return @"";
    }
    //end
    if ([value isKindOfClass:[NSString class]])
    {
        if ([value isEqualToString:@"<null>"]||[value isEqualToString:@"<NULL>"])
        {
            return @"";
        }
        else if([value isEqualToString:@"(null)"]||[value isEqualToString:@"(NULL)"])
        {
            return @"";
        }
        return (NSString *)value;
    }
    else if([value isKindOfClass:[NSNumber class]])
    {
        return [value stringValue];
    }
    else if ([value isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    else
    {
        return @"";
    }
}

//判断返回字段是否为Array类型  防止crash
+ (NSArray *)exchangeTheReturnValueToArray:(id)value
{
    if (value)
    {
        if ([value isKindOfClass:[NSNull class]])
        {
            return [NSArray array];
        }
        return (NSArray *)value;
    }
    return [NSArray array];
}

@end
