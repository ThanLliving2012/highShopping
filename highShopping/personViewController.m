//
//  personViewController.m
//  highShopping
//
//  Created by 周磊 on 15/12/28.
//  Copyright © 2015年 周磊. All rights reserved.
//

#import "personViewController.h"
#import "AppDelegate.h"
#import "RxWebViewController.h"
#import "UMFeedback.h"

@interface personViewController ()

@end

@implementation personViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication].delegate;
    if ([app.window.rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *rootNavi=(UINavigationController*)app.window.rootViewController;
        rootNavi.navigationBar.topItem.title=@"个人中心";
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark-tableviewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //    return self.datas.count;
    return 1;
}
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    if (section==0) {
//        return @"开启“防骚扰模式”后,将自动屏蔽\r该时间段的任何提醒";
//    }
//    return nil;
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented
{
    return 2;
}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;{
//    return sectionView;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    return  (Rotation_Screen_Width/320)*146;
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        //        cell=[[[NSBundle mainBundle]loadNibNamed:@"schoolViewCell" owner:self options:nil]lastObject];
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section==0) {
        cell.textLabel.text=@"用户反馈";
        
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
//        NSString *path = [paths objectAtIndex:0];
//        path=[path stringByAppendingString:DEMAND_CACH_DIRTECTORY];
//        
//        double FileSize=[Manager getDirectorySizeForPath:path];
//        float rong = (float)FileSize;
//        NSString *huancun = [NSString stringWithFormat:@"%.1fM",rong];
//        cell.detailTextLabel.text=huancun;
        
    }else if (indexPath. section==1){
        cell.textLabel.text=@"关于我们";
        
    }
    
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;{
    
    
    if (indexPath.row==0) {
        AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication].delegate;
        if ([app.window.rootViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *rootNavi=(UINavigationController*)app.window.rootViewController;
            [rootNavi pushViewController:[UMFeedback feedbackViewController] animated:YES];
            
        }

        
    }else if (indexPath.row==1){
        
        RxWebViewController *rxWebView=[[RxWebViewController alloc]initWithUrl:[NSURL URLWithString:aboutUsUrl]];
        AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication].delegate;
        if ([app.window.rootViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *rootNavi=(UINavigationController*)app.window.rootViewController;
            [rootNavi pushViewController:rxWebView animated:YES];
        }

    }
}

- (IBAction)rukouButtonAction:(id)sender{
 
    
    UIButton *btn=(UIButton*)sender;
    NSString *urlString=nil;
    if (btn.tag==0) {
        urlString=taobaoOrders;
    }else if (btn.tag==1){
        urlString=taobaoSaved;
    }else if (btn.tag==2){
        urlString=taobaoRecords;
    }
    RxWebViewController *rxVC=[[RxWebViewController alloc]initWithUrl:[NSURL URLWithString:urlString]];
    
    AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication].delegate;
    if ([app.window.rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *rootNavi=(UINavigationController*)app.window.rootViewController;
        [rootNavi pushViewController:rxVC animated:YES];
        
    }

    
}



@end
