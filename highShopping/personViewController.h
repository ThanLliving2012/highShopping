//
//  personViewController.h
//  highShopping
//
//  Created by 周磊 on 15/12/28.
//  Copyright © 2015年 周磊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface personViewController : UIViewController

@property(nonatomic,assign)IBOutlet UITableView *personTableView;

- (IBAction)rukouButtonAction:(id)sender;
@end
