//
//  JMasterViewController.m
//  Johnson_Sample_App
//
//  Created by JOHNSON J on 14/07/14.
//  Copyright (c) 2014 JOHNSON IOSAPPS. All rights reserved.
//

#import "JMasterViewController.h"
#import "JTableViewCustomCellTableViewCell.h"
#import "JDetailViewController.h"
#define kPhotoFileName @"photoList"
#define kPhotoFileType @"plist"
#define kAlertMessage @"No internet connection!.Please check your network settings"
#define kAlertTitle @"Retry"
#define kRefreshButton @"Refresh"
#define kExitButton @"Exit"
#define kName @"name"
#define kImage @"image"
#define kDetailView @"detailView"
#define kMainStoryBoard @"Main"
#define kTitle @"Johnson Sample App"

@interface JMasterViewController () {
}
@end

@implementation JMasterViewController

@synthesize  photos=_photos,isAlertShown=_isAlertShown;


-(NSDictionary*)photos //Loading the Photos URL to a dictioary
{
    if (!_photos)
    {
        _photos=[[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:kPhotoFileName ofType:kPhotoFileType]];
    }
    return _photos;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.coveView.bounds=[[UIScreen mainScreen] bounds];
    [self.view addSubview:self.coveView];
    self.title=kTitle;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self photos];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)reloadData:(id)sender//Refresh Data
{
    [self.tableView reloadData];
}



#pragma mark - UITableView Datasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _photos.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *kCellIdentifier=@"Cell Identfier";
    JTableViewCustomCellTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    if(!cell)
    {
        cell=[[JTableViewCustomCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
        cell.selectionStyle=UITableViewCellEditingStyleNone;
    }
    if(!cell.cellImage.image)
    {
        //Using GCD to perform asynchroubous laoding of images from URL
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                       ^{
                           NSData *imageData=[NSData dataWithContentsOfURL:[NSURL URLWithString:[_photos objectForKey:[[_photos allKeys] objectAtIndex:indexPath.row]]]];
                           
                           dispatch_async(dispatch_get_main_queue(),
                                          ^{
                                              if(imageData)
                                              {
                                              UIImage *image=[UIImage imageWithData:imageData];
                                              [cell.cellActivity stopAnimating];
                                              cell.cellImage.image=image;
                                              cell.cellLabel.text=[[_photos allKeys] objectAtIndex:indexPath.row];
                                                  [self.coveView removeFromSuperview];
                                              }
                                              else if(!_isAlertShown)
                                              {
                                                  UIAlertView *alert=[[UIAlertView alloc] initWithTitle:kAlertTitle message:kAlertMessage delegate:self cancelButtonTitle:kRefreshButton otherButtonTitles:kExitButton, nil];
                                                  alert.delegate=self;
                                                  [alert show];
                                                  _isAlertShown=YES;
                                              }
                                          });
                           
                       });
    }
    return cell;
}


#pragma UITableViewDelegate method


- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    JTableViewCustomCellTableViewCell *cell=(JTableViewCustomCellTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    BOOL shouldHighLight=NO;
    if(cell.cellImage.image)
    {
        shouldHighLight= YES;
    }
    return shouldHighLight;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JTableViewCustomCellTableViewCell *cell=(JTableViewCustomCellTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(cell.cellImage.image)
    {
        NSDictionary *dataDict=[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:cell.cellImage.image,cell.cellLabel.text, nil] forKeys:[NSArray arrayWithObjects:kImage,kName, nil]];
        UIStoryboard *mainBoard=[UIStoryboard storyboardWithName:kMainStoryBoard bundle:[NSBundle mainBundle]];
        JDetailViewController *detailObejct=[mainBoard instantiateViewControllerWithIdentifier:kDetailView];
        [detailObejct setDetailItem:dataDict];
        [self.navigationController pushViewController:detailObejct animated:YES];
    }

}


#pragma UIAlertViewDelegate method

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex)
    {
        exit(0);//To exit the application if there is no internet connection

    }
    else
    {
        _isAlertShown=NO;
        [self reloadData:nil];
    }
}



@end
