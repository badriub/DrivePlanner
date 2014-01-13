//
//  CityManager.m
//  DrivePlanner
//
//  Created by Badari Madhav on 1/7/14.
//  Copyright (c) 2014 org.poobad. All rights reserved.
//

#import "CityManager.h"
#import "GeoBytesCommunicator.h"
#import "CityBuilder.h"

@implementation CityManager

- (void)fetchCities:(NSString*)city {
    [self.communicator searchCities:city];
}

- (void)receivedCitiesJSON:(NSData *)objectNotation {
    NSError *error = nil;
    NSArray *cities = [CityBuilder citiesFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingCitiesFailedWithError:error];
        
    } else {
        [self.delegate didReceiveCities:cities];
    }
}

- (void)fetchingCitiesFailedWithError:(NSError *)error {
    [self.delegate fetchingCitiesFailedWithError:error];
}


@end
