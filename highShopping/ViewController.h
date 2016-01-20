//
//  ViewController.h
//  highShopping
//
//  Created by 周磊 on 15/12/10.
//  Copyright © 2015年 周磊. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "SDCycleScrollView.h"

@interface ViewController : UIViewController<SDCycleScrollViewDelegate>


@property(nonatomic,strong)SDCycleScrollView *sdCycleScrollView;
@property(nonatomic,assign)IBOutlet UICollectionView *mCollectionView;
@end

