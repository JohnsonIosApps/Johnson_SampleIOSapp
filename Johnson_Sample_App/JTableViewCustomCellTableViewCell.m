//
//  JTableViewCustomCellTableViewCell.m
//  Johnson_Sample_App
//
//  Created by JOHNSON J on 14/07/14.
//  Copyright (c) 2014 JOHNSON IOSAPPS. All rights reserved.
//

#import "JTableViewCustomCellTableViewCell.h"

@implementation JTableViewCustomCellTableViewCell
@synthesize cellImage,cellLabel,cellActivity;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
