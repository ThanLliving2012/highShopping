//
//  productListViewController.m
//  highShopping
//
//  Created by 周磊 on 15/12/29.
//  Copyright © 2015年 周磊. All rights reserved.
//

#import "productListViewController.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "RxWebViewController.h"
#import "UIImageView+WebCache.h"
#import "NSString+dealString.h"
#import "UnitMetiodManager.h"
#import "SVProgressHUD.h"




static NSInteger  ImageViewTag = 10;
static NSInteger  detailLabelTag = 11;

static NSInteger  nowPriceLabelTag = 12;
static NSInteger  orignalPriceLabelTag = 13;


@interface productListViewController ()
{
    NSMutableArray *productDatasArray;

}
@end

@implementation productListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.catDictionary) {
        self.title=[self.catDictionary objectForKey:@"name"];
 
    }
    // Do any additional setup after loading the view.
    [self setupCollectionView];
    NSString *urlString=[NSString stringWithFormat:@"%@cid=%@",mainViewDataUrlString,[self.catDictionary objectForKey:@"cid"]];
    [self RequestDataWithUrlString:urlString withTag:1];

    
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
- (void)setupCollectionView{
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    NSInteger volumeNum=2;  //一行几个 item
    NSInteger volumeInterNum=2; //item 横向间距
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        volumeNum=3;
        volumeInterNum=5;
    }
    float itemWith=Rotation_Screen_Width/volumeNum-volumeInterNum;
    flowLayout.itemSize=CGSizeMake(itemWith, itemWith+50.0);
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing=10.0;
    flowLayout.minimumInteritemSpacing=0.0;
    
    self.proCollectionView.collectionViewLayout=flowLayout;
    //添加 cell
    [self.proCollectionView registerNib:[UINib nibWithNibName:@"productView" bundle:nil] forCellWithReuseIdentifier:@"cellIndentify"];
    
    self.proCollectionView.backgroundColor=totalTableviewColor;
    
    
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
        UIImageView *imageView = (UIImageView *)[cell viewWithTag:ImageViewTag];
        NSString *imageString=[dataDic objectForKey:@"pic_url"];
        
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
            if (tag==1){
                //首页商品
                productDatasArray= (NSMutableArray*)[UnitMetiodManager exchangeTheReturnValueToArray:[responDic objectForKey:@"data"]];
                [self.proCollectionView reloadData];
            }
            
        }else{
            
            [SVProgressHUD displayDurationForString:SERVER_FAIL_MESSAGE];
            
        }
        
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        [SVProgressHUD displayDurationForString:NETWORK_FAIL_MESSAGE];
        
    }];
    
}


@end
