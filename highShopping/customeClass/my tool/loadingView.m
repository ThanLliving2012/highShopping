//
//  loadingView.m
//  hongJiu
//
//  Created by zhoulei on 13-8-23.
//  Copyright (c) 2013年 zhoulei. All rights reserved.
//

#import "loadingView.h"
#import "AppDelegate.h"
@implementation loadingView

+(id)shareObject
{
   static loadingView *sss=nil;
    if (sss==nil) {
        sss=(loadingView*)[[[NSBundle mainBundle]loadNibNamed:@"loadingView" owner:self options:nil] lastObject];

    }
    return sss;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//       self.frame=CGRectMake(0, 0, 125, 125);
//        AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
//        self.center=app.window.center;
//        self.backgroundColor=[UIColor redColor];

////        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"jiazailoading.gif" ofType:nil];
////        gifLoadingView = [[SCGIFImageView alloc] initWithGIFFile:filePath];
////        gifLoadingView.frame=self.bounds;
////        [self addSubview:gifLoadingView];
////        
//        NSString *filePath1 = [[NSBundle mainBundle] pathForResource:@"jiazailoading.gif" ofType:nil];
//        gifLoadFaiedView = [[SCGIFImageView alloc] initWithGIFFile:filePath1];
//        gifLoadFaiedView.frame=self.bounds;
//        [self addSubview:gifLoadFaiedView];

        self.hidden=YES;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)showLoadingView
{
//    [app.window addSubview:self];
   self.hidden=NO;
    [loadingActiviView startAnimating];

}
-(void)showLoadedFailedView
{
    
//    [self bringSubviewToFront:gifLoadFaiedView];
    self.hidden=NO;
    
}
-(void)hideLoadView
{
    self.hidden=YES;
    [loadingActiviView stopAnimating];
}

@end
