//
//  JDetailViewController.m
//  Johnson_Sample_App
//
//  Created by JOHNSON J on 14/07/14.
//  Copyright (c) 2014 JOHNSON IOSAPPS. All rights reserved.
//

#import "JDetailViewController.h"
#define kName @"name"
#define kImage @"image"

@interface JDetailViewController ()
- (void)configureView;
@end

@implementation JDetailViewController
@synthesize detailDescriptionImage,detailDescriptionLabel;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem objectForKey:kName];
        self.detailDescriptionImage.image = [self.detailItem objectForKey:kImage];

    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    self.detailDescriptionBar.topItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(goHome)];
    self.detailDescriptionBar.topItem.title=[self.detailItem objectForKey:kName];
}

-(void)goHome
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
