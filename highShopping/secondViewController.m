//
//  secondViewController.m
//  highShopping
//
//  Created by 周磊 on 15/12/28.
//  Copyright © 2015年 周磊. All rights reserved.
//

#import "secondViewController.h"
#import "AppDelegate.h"
#import "productListViewController.h"
#import "SVProgressHUD.h"
#import "AFNetworking.h"
#import "UnitMetiodManager.h"

#import "ViewController.h"

#import "RxWebViewController.h"
#import "UIImageView+WebCache.h"


@interface secondViewController ()
{
    NSArray *cateDatas;
}
@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
//  __block NSString *test;
//    void(^myBlock)(NSString*)=^(NSString *eeee){
//         test=@"eea";
//    };
//    myBlock(@"e2323");
    [self setUpCollectionView];
    [self RequestDataWithUrlString:cateUrlString withTag:1];
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setUpCollectionView{

    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    NSInteger volumeNum=2;  //一行几个 item
    NSInteger volumeInterNum=2; //item 横向间距
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        volumeNum=3;
        volumeInterNum=5;
    }
    float itemWith=Rotation_Screen_Width/volumeNum-volumeInterNum;
    flowLayout.itemSize=CGSizeMake(itemWith, itemWith/2.0);
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing=10.0;
    flowLayout.minimumInteritemSpacing=0.0;
    self.secondCollectionView.collectionViewLayout=flowLayout;
    
    [self.secondCollectionView registerNib:[UINib nibWithNibName:@"categoryCellView" bundle:nil] forCellWithReuseIdentifier:@"cellIndentify"];
    self.secondCollectionView.backgroundColor=totalTableviewColor;


    
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication].delegate;
    if ([app.window.rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *rootNavi=(UINavigationController*)app.window.rootViewController;
        rootNavi.navigationBar.topItem.title=@"分类";
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
#pragma mark-collectionDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;{
    return cateDatas.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    //重用cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIndentify" forIndexPath:indexPath];
    
    if (indexPath.row<cateDatas.count) {
        
        NSDictionary *one=[cateDatas objectAtIndex:indexPath.row];
        
        UIImageView *catImge=(UIImageView*)[cell viewWithTag:10];
        [catImge sd_setImageWithURL:[NSURL URLWithString:[one objectForKey:@"pic"]] placeholderImage:nil options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
        }];
    }
    return cell;
    
    
}

#pragma mark-collectionViewDelegate


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row<cateDatas.count) {
        NSDictionary *one=[cateDatas objectAtIndex:indexPath.row];
        
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

        productListViewController *productVc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"productListViewController"];
        productVc.catDictionary=one;

        AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication].delegate;
        if ([app.window.rootViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *rootNavi=(UINavigationController*)app.window.rootViewController;
            [rootNavi pushViewController:productVc animated:YES];
            
        }

     }
    
}

#pragma mark-RequestData
-(void)RequestDataWithUrlString:(NSString*)urlString  withTag:(NSInteger)tag{
    
    [SVProgressHUD showWithStatus:@"正在加载"];
    
    NSString *enCodeUrlString=[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *AFRequestManager=[AFHTTPRequestOperationManager manager];
    //    [AFRequestManager.securityPolicy setAllowInvalidCertificates:YES];
    //ios 9中访问 http 的接口 系统会默认使用 ATS，需要在 plist 中设置不使用 ATS，
    AFRequestManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型
    [AFRequestManager GET:enCodeUrlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        [SVProgressHUD dismiss];
        cateDatas=(NSArray*)responseObject;
        if (cateDatas.count>0) {
                //首页商品
            [self.secondCollectionView reloadData];
            
            
        }else{
            
            [SVProgressHUD displayDurationForString:SERVER_FAIL_MESSAGE];
            
        }
        
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        [SVProgressHUD displayDurationForString:NETWORK_FAIL_MESSAGE];
        
    }];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    
}
@end
