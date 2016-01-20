//
//  loadingView.h
//  hongJiu
//
//  Created by zhoulei on 13-8-23.
//  Copyright (c) 2013年 zhoulei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loadingView : UIView
{
    UIImageView *gifLoadingView;
    UIImageView *gifLoadFaiedView;
    
  IBOutlet  UIActivityIndicatorView *loadingActiviView;
  IBOutlet  UILabel *loadingLabel;
}
+(id)shareObject;
-(void)showLoadingView;
-(void)showLoadedFailedView;
-(void)hideLoadView;

@end
