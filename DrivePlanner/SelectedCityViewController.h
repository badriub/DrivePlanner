//
//  SelectedCityViewController.h
//  DrivePlanner
//
//  Created by Badari Madhav on 1/12/14.
//  Copyright (c) 2014 org.poobad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedCityViewController : UITableViewController
- (IBAction)dismiss:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray* selectedCities;
@property (strong, nonatomic) NSString* name;

@end
