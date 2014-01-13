//
//  CityTableViewController.h
//  DrivePlanner
//
//  Created by Badari Madhav on 1/7/14.
//  Copyright (c) 2014 org.poobad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityManagerDelegate.h"

@interface CityTableViewController : UITableViewController <CityManagerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray* selectedCities;

@end
