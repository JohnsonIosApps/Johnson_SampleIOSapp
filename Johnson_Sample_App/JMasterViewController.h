//
//  JMasterViewController.h
//  Johnson_Sample_App
//
//  Created by JOHNSON J on 14/07/14.
//  Copyright (c) 2014 JOHNSON IOSAPPS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMasterViewController : UIViewController <UIAlertViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak,nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSDictionary *photos;
@property (assign,nonatomic) BOOL isAlertShown;
@property (weak,nonatomic) IBOutlet UIView *coveView;

@end
