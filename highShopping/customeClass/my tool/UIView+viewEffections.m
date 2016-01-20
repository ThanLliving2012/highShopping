//
//  UIView+viewEffections.m
//  hongJiu
//
//  Created by zhoulei on 13-8-17.
//  Copyright (c) 2013年 zhoulei. All rights reserved.
//

#import "UIView+viewEffections.h"

#define MKkCaptionPadding 1

@implementation UIView (viewEffections)


-(void)RoundViewWithCornerRadius:(CGFloat)cornerRadiu withShowdow:(CGFloat)shadow
{
    self.layer.cornerRadius = cornerRadiu;
    self.clipsToBounds=YES;
    
    if (shadow>0) {
//        UIView *shadowView=[[UIView alloc]initWithFrame:self.bounds];
//        shadowView.layer.shadowColor = [UIColor redColor].CGColor;
//        shadowView.layer.shadowOffset = CGSizeMake(0, 1);
//        shadowView.layer.shadowOpacity = 1;
//        shadowView.layer.shadowRadius = 9.0;
//        shadowView.clipsToBounds = NO;
//        [shadowView addSubview:self];
        
        //添加边框
        //    CALayer *layer = [self layer];
        //    layer.borderColor = [[UIColor whiteColor] CGColor];
        //    layer.borderWidth = 5.0f;
        //添加四个边阴影
        //    self.layer.shadowColor = [UIColor redColor].CGColor;
        //    self.layer.shadowOffset = CGSizeMake(4, 4);
        //    self.layer.shadowOpacity = 1.0;
        //    self.layer.shadowRadius = 10.0;
        //添加两个边阴影
        //    self.layer.shadowColor = [UIColor blackColor].CGColor;
        //    self.layer.shadowOffset = CGSizeMake(4, 4);
        //    self.layer.shadowOpacity = 0.5;
        //    self.layer.shadowRadius = 2.0;

    }
}
-(void)tableViewScrollToTop
{
    UITableView *tableView=(UITableView*)self;
    [tableView scrollRectToVisible:CGRectMake(0, 0, tableView.frame.size.width, tableView.frame.size.height) animated:NO];
//    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathWithIndex:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

+(NSInteger)caculateLableHeightWithLabe:(UILabel *)Label withText:(NSString *)text withLimitNumLines:(NSInteger)limitLine
{
    //根据文字内容动态调整大小
    
    if (text.length==0) return NO;
    float captionWidth = Label.frame.size.width;
    UIFont *font=[Label font];
    CGSize textSize = [text sizeWithAttributes:@{NSFontAttributeName:font}];

    NSUInteger numLines = ceilf( textSize.width / captionWidth );
    if (numLines>=limitLine) {
        numLines=limitLine;
    }
    
    NSInteger height = ( textSize.height + MKkCaptionPadding ) * numLines;
//    CGSize size=[text sizeWithFont:font constrainedToSize:CGSizeMake(captionWidth, MAXFLOAT) lineBreakMode:Label.lineBreakMode];
    NSInteger containerHeight = height+MKkCaptionPadding*2;
    return containerHeight;
}

//同一label添加不同颜色，不同字体的文字等等
-(NSMutableAttributedString*)labelDealWithAttributedString:(NSString*)oneString  nextString:(NSString*)twoString;
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@",oneString,twoString]];
    NSRange oneRange=[oneString rangeOfString:oneString];
    NSRange twoRange=[twoString rangeOfString:twoString];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:oneRange];
    UIColor *color=[UIColor lightGrayColor];
    [str addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(oneRange.length+1, twoRange.length)];
    return str;

}

- (void)blur{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CIImage *imageToBlur = [CIImage imageWithCGImage:viewImage.CGImage];
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
    [gaussianBlurFilter setValue:imageToBlur forKey: @"inputImage"];
    [gaussianBlurFilter setValue:[NSNumber numberWithFloat: 15] forKey: @"inputRadius"];
    CIImage *resultImage = [gaussianBlurFilter valueForKey: @"outputImage"];
    
    CGImageRef cgImage = [context createCGImage:resultImage fromRect:self.bounds];
    UIImage *blurredImage = [UIImage imageWithCGImage:cgImage];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.tag = -1;
    imageView.image = blurredImage;
    
    UIView *overlay = [[UIView alloc] initWithFrame:self.bounds];
    overlay.tag = -2;
    overlay.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    
    [self addSubview:imageView];
    [self addSubview:overlay];
    
}

-(void)unBlur{
    [[self viewWithTag:-1] removeFromSuperview];
    [[self viewWithTag:-2] removeFromSuperview];
}

@end
