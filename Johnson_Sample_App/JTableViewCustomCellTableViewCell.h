//
//  JTableViewCustomCellTableViewCell.h
//  Johnson_Sample_App
//
//  Created by JOHNSON J on 14/07/14.
//  Copyright (c) 2014 JOHNSON IOSAPPS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTableViewCustomCellTableViewCell : UITableViewCell

@property(weak,nonatomic) IBOutlet UIImageView *cellImage;
@property(weak,nonatomic) IBOutlet UILabel *cellLabel;
@property(weak,nonatomic) IBOutlet UIActivityIndicatorView *cellActivity;


@end
