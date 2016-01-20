//
//  UIView+viewEffections.h
//  hongJiu
//
//  Created by zhoulei on 13-8-17.
//  Copyright (c) 2013年 zhoulei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface UIView (viewEffections)
-(void)RoundViewWithCornerRadius:(CGFloat)cornerRadiu withShowdow:(CGFloat)shadow
;//设置view的圆角，如果为圆形，则cornerRadiu为view的半径
-(void)tableViewScrollToTop;
+(NSInteger)caculateLableHeightWithLabe:(UILabel *)Label withText:(NSString *)text withLimitNumLines:(NSInteger)limitLine;
-(NSMutableAttributedString*)labelDealWithAttributedString:(NSString*)oneString  nextString:(NSString*)twoString;

- (void)blur;
@end
