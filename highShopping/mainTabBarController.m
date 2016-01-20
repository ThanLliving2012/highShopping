//
//  mainTabBarController.m
//  highShopping
//
//  Created by 周磊 on 15/12/28.
//  Copyright © 2015年 周磊. All rights reserved.
//

#import "mainTabBarController.h"

@interface mainTabBarController ()

@end

@implementation mainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 默认情况下,app运行之后,只执行第一个控制器的view did load方法,因此,要得到UITabBarController容器中所有的控制器,调用其自定义的一个方法,设置它们自己的tabbaritem样式
//    
//    // 先得到父容器UITabBarController,有了它,就有了所有的控制器实例的引用
//    UITabBarController *parentCtrl = self.parentViewController;
//    // 得到容器UITabBarController中所有的子控制器
//    NSArray *children = [parentCtrl childViewControllers];
//    // 调用对应的子控制器的 自定义方法,设置它们自己的tabbaritem样式
    
    self.navigationController.navigationBar.translucent=NO;
    self.navigationController.navigationBarHidden=NO;
    self.navigationController.navigationBar.topItem.title=@"精选";
    //设置返回按钮的文字
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];

    //设置导航栏图标颜色，如系统自动的返回箭头
    self.navigationController.navigationBar.tintColor =[UIColor whiteColor];


    //设置导航栏上所有字的颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

    self.navigationController.interactivePopGestureRecognizer.enabled=YES;
    self.navigationController.navigationBar.barTintColor=totalThemeTextColor;
    [self.viewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIViewController *oneController=(UIViewController*)obj;
        
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"tabbarItem_%ld",(unsigned long)idx]];
        
        UIImage *img_selected = [UIImage imageNamed:[NSString stringWithFormat:@"tabbarItem_select_%ld",(unsigned long)idx]];

        // 设置图片 渲染 模式
        img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        // 设置图片 渲染 模式
        img_selected = [img_selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        // 构造方法生成 UITabBarItem
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:img selectedImage:img_selected];
        
        if (idx==0) {
            item.title = @"精选";
        }else if (idx==1){
            item.title  = @"分类";
            
        } else if (idx==2){
           item.title  = @"购物车";
        } else if (idx==3){
           item.title  = @"个人中心";
        }
        
        
        // 改变 tab bar items的字体的不同状态的颜色 Change the title color of tab bar items
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor darkGrayColor], NSForegroundColorAttributeName,
                                                           nil] forState:UIControlStateNormal];
        
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                           totalThemeTextColor, NSForegroundColorAttributeName,
                                                           nil] forState:UIControlStateHighlighted];
        
        
        // 设置当前控制器的 tabBarItem属性
        oneController.tabBarItem = item;
        
//        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",1] ;
        
        
    }];
//
//    // 调用对应的子控制器的 自定义方法,设置它们自己的tabbaritem样式
//    SettingViewController *setVC = (SettingViewController *)[children objectAtIndex:2];
//    [setVC setTabBarItemDIY];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//暂时没有用上
- (void) setTabBarItemDIY
{
    // UITabbarController里面的tabbarItem中的图片需要特殊API处理之后,才能正常显示
    UIImage *img = [UIImage imageNamed:@"setting"];
    UIImage *img_selected = [UIImage imageNamed:@"setting_s"];
    // 设置图片 渲染 模式
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置图片 渲染 模式
    img_selected = [img_selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 构造方法生成 UITabBarItem
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:img selectedImage:img_selected];
    
    // 设置当前控制器的 tabBarItem属性
    self.tabBarItem = item;
    self.tabBarItem.title = @"我的";
    self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",3] ;
}

@end
