//
//  productListViewController.h
//  highShopping
//
//  Created by 周磊 on 15/12/29.
//  Copyright © 2015年 周磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface productListViewController : UIViewController



@property(nonatomic,assign)IBOutlet UICollectionView *proCollectionView;

@property(nonatomic,retain)NSDictionary *catDictionary;

@end
