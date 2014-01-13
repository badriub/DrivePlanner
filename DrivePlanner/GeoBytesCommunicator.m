//
//  GeoBytesCommunicator.m
//  DrivePlanner
//
//  Created by Badari Madhav on 1/7/14.
//  Copyright (c) 2014 org.poobad. All rights reserved.
//

#import "GeoBytesCommunicator.h"
#import "GeoBytesCommunicatorDelegate.h"

#define PAGE_COUNT 20

@implementation GeoBytesCommunicator

- (void)searchCities:(NSString *)city
{
    NSString *urlAsString = [NSString stringWithFormat:@"http://gd.geobytes.com/AutoCompleteCity?q=%@", city];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingCitiesFailedWithError:error];
        } else {
            [self.delegate receivedCitiesJSON:data];
        }
    }];
}

@end
