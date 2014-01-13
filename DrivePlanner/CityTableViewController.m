//
//  CityTableViewController.m
//  DrivePlanner
//
//  Created by Badari Madhav on 1/7/14.
//  Copyright (c) 2014 org.poobad. All rights reserved.
//

#import "CityTableViewController.h"
#import "CityManager.h"
#import "GeoBytesCommunicator.h"
#import "City.h"
#import "SelectedCityViewController.h"

@interface CityTableViewController () 

@end

@implementation CityTableViewController

@synthesize tableView = _tableView;
@synthesize selectedCities;

NSArray *searchResults;
NSArray *_cities;
CityManager *_manager;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SelectedCityViewController* dvc = [segue destinationViewController];
    NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
    NSString* cityName = [[_cities objectAtIndex:indexPath.row] name];
    
    NSLog(@"selected city is %@", cityName);
    if(dvc.selectedCities == nil) {
        dvc.selectedCities = [[NSMutableArray alloc]initWithObjects:cityName, nil];
    } else {
        [dvc.selectedCities addObject:cityName];
    }

    
    [dvc setName:cityName];
    NSLog(@"Count is %i",[dvc.selectedCities count]);
}

- (void)didReceiveCities:(NSArray *)cities {
    _cities = cities;
    [self.tableView reloadData];
}

- (void)fetchingCitiesFailedWithError:(NSError *)error {
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _manager = [[CityManager alloc] init];
    _manager.communicator = [[GeoBytesCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [_manager fetchCities:@"Boston"];
    
    selectedCities = [[NSMutableArray alloc]init];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Selected cities";
    } else {
        return @"Cities";
    }
}

-(BOOL)isCitySelected:(NSString *)city {
    return [selectedCities containsObject:city];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 1) {
         NSString* cityName = [[_cities objectAtIndex:indexPath.row] name];
        if(![self isCitySelected:cityName]) {
            [selectedCities addObject:cityName];
        }
        [self.tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0) {
        return [selectedCities count];
    } else {
        if (tableView == self.searchDisplayController.searchResultsTableView) {
            return [searchResults count];
            
        } else {
            return [_cities count];
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if(nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(indexPath.section == 0) {
        [cell.textLabel setText:[selectedCities objectAtIndex:indexPath.row]];

    } else {
        City* city = _cities[indexPath.row];
        [cell.textLabel setText:city.name];
    }
    
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
