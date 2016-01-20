//
//  ViewController.m
//  highShopping
//
//  Created by 周磊 on 15/12/10.
//  Copyright © 2015年 周磊. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"

#import "UnitMetiodManager.h"
#import "UIImageView+WebCache.h"
#import "NSString+dealString.h"
#import "RxWebViewController.h"
#import "AppDelegate.h"

#import "productListViewController.h"


static NSInteger  ImageViewTag = 10;
static NSInteger  detailLabelTag = 11;

static NSInteger  nowPriceLabelTag = 12;
static NSInteger  orignalPriceLabelTag = 13;

static NSInteger headViewHeight=120;




@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSMutableArray *productDatasArray;
    NSMutableArray *adDatasArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    

    [self setupCollectionView];
    [self RequestDataWithUrlString:gqAdUrl withTag:0]; //请求轮播图
    
    [self RequestDataWithUrlString:mainViewDataUrlString withTag:1];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication].delegate;
    if ([app.window.rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *rootNavi=(UINavigationController*)app.window.rootViewController;
        rootNavi.navigationBar.topItem.title=@"精选";
    }
    
}

- (void)setupCollectionView{

    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    NSInteger volumeNum=2;  //一行几个 item
    NSInteger volumeInterNum=2; //item 横向间距
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        volumeNum=3;
        volumeInterNum=5;
        headViewHeight=190.0;
    }
    float itemWith=Rotation_Screen_Width/volumeNum-volumeInterNum;
    flowLayout.itemSize=CGSizeMake(itemWith, itemWith+50.0);
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing=10.0;
    flowLayout.minimumInteritemSpacing=0.0;
    flowLayout.headerReferenceSize = CGSizeMake(Rotation_Screen_Width, headViewHeight);//头部

    self.mCollectionView.collectionViewLayout=flowLayout;
    //添加 cell
    [self.mCollectionView registerNib:[UINib nibWithNibName:@"productView" bundle:nil] forCellWithReuseIdentifier:@"cellIndentify"];
    
    [self.mCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    

    self.mCollectionView.backgroundColor=totalTableviewColor;

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-collectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;{
    return productDatasArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    //重用cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIndentify" forIndexPath:indexPath];
    if (indexPath.row<productDatasArray.count) {
        NSDictionary *dataDic=[productDatasArray objectAtIndex:indexPath.row];
        
        //赋值
        NSString *imageString=[dataDic objectForKey:@"pic_url"];

        UIImageView *imageView = (UIImageView *)[cell viewWithTag:ImageViewTag];
        if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
            imageString= [imageString stringByAppendingString:IPAD_IMAGE_SIZE];

        }else{
        
           imageString= [imageString stringByAppendingString:IPHONE_IMAGE_SIZE];
        }
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageString] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
        }];
        
        NSString *detailString = [UnitMetiodManager exchangeTheReturnValueToString:[dataDic objectForKey:@"title"]];
        UILabel *detailLabel = (UILabel *)[cell viewWithTag:detailLabelTag];
        detailLabel.text=detailString;

        
        NSString *nowPrice = [UnitMetiodManager exchangeTheReturnValueToString:[dataDic objectForKey:@"now_price"]];
        nowPrice=[nowPrice dealWithDecimalNum:1];
        
        UILabel *nowPriceLabel = (UILabel *)[cell viewWithTag:nowPriceLabelTag];
        nowPriceLabel.text=[NSString stringWithFormat:@"￥%@",nowPrice];
        
    
        
        NSString *orignalPrice = [UnitMetiodManager exchangeTheReturnValueToString:[dataDic objectForKey:@"now_price"]];
        
        orignalPrice=[orignalPrice dealWithDecimalNum:1];
        UILabel *orignalPriceLabel = (UILabel *)[cell viewWithTag:orignalPriceLabelTag];
        orignalPriceLabel.text=[NSString stringWithFormat:@"￥%@",orignalPrice];



        
    }
    return cell;
    
    
}

#pragma mark-collectionViewDelegate


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if (kind==UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:
                                                UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
        if (self.sdCycleScrollView==nil) {
            CGRect sdRect=CGRectMake(0, 0,Rotation_Screen_Width, headViewHeight);
            self.sdCycleScrollView=[SDCycleScrollView cycleScrollViewWithFrame:sdRect delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
            self.sdCycleScrollView.pageDotColor=[UIColor lightTextColor];
            
        }
        [headerView addSubview:self.sdCycleScrollView];
        return headerView;

    }
    return nil;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row<productDatasArray.count) {
        
        NSDictionary *one=[productDatasArray objectAtIndex:indexPath.row];
        NSString *urlString=[one objectForKey:@"url"];
        RxWebViewController *rxVC=[[RxWebViewController alloc]initWithUrl:[NSURL URLWithString:urlString]];
        
        
        AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication].delegate;
        if ([app.window.rootViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *rootNavi=(UINavigationController*)app.window.rootViewController;
            [rootNavi pushViewController:rxVC animated:YES];
            
        }
        
        

    }
    
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
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
        NSDictionary *responDic=(NSDictionary*)responseObject;
        if (responDic) {
            if (tag==0) {
                //处理轮播
                
                adDatasArray= (NSMutableArray*)[UnitMetiodManager exchangeTheReturnValueToArray:[responDic objectForKey:@"data"]];
                NSMutableArray *adUrls=[[NSMutableArray alloc]init];
                [adDatasArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                   
                    NSDictionary *oneDic=(NSDictionary*)obj;
                    NSString *urlString=[oneDic objectForKey:@"iphoneimg"];
                    if (urlString) {
                        [adUrls addObject:urlString];
                    }
                }];
                self.sdCycleScrollView.imageURLStringsGroup=adUrls;
                
                
            }else if (tag==1){
               //首页商品
                productDatasArray= (NSMutableArray*)[UnitMetiodManager exchangeTheReturnValueToArray:[responDic objectForKey:@"data"]];
                [self.mCollectionView reloadData];
            }
            

        }else{

            [SVProgressHUD displayDurationForString:SERVER_FAIL_MESSAGE];
            
        }
        
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        [SVProgressHUD displayDurationForString:NETWORK_FAIL_MESSAGE];
        
    }];
    
}

#pragma mark-cycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
 
    if (index<adDatasArray.count) {
        NSDictionary *one=[adDatasArray objectAtIndex:index];
        NSString *urlString=[one objectForKey:@"link"];
        RxWebViewController *rxVC=[[RxWebViewController alloc]initWithUrl:[NSURL URLWithString:urlString]];
        
        AppDelegate *app=(AppDelegate*)[UIApplication sharedApplication].delegate;
        if ([app.window.rootViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *rootNavi=(UINavigationController*)app.window.rootViewController;
            [rootNavi pushViewController:rxVC animated:YES];
            
        }
    }
    
  

}
@end
