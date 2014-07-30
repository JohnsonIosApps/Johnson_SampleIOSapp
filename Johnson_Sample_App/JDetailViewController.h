//
//  JDetailViewController.h
//  Johnson_Sample_App
//
//  Created by JOHNSON J on 14/07/14.
//  Copyright (c) 2014 JOHNSON IOSAPPS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UINavigationBar *detailDescriptionBar;

@property (weak, nonatomic) IBOutlet UIImageView *detailDescriptionImage;


@end
