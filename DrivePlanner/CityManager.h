//
//  CityManager.h
//  DrivePlanner
//
//  Created by Badari Madhav on 1/7/14.
//  Copyright (c) 2014 org.poobad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeoBytesCommunicatorDelegate.h"
#import "CityManagerDelegate.h"

@class GeoBytesCommunicator;

@interface CityManager : NSObject <GeoBytesCommunicatorDelegate>

@property (strong, nonatomic) GeoBytesCommunicator *communicator;
@property (weak, nonatomic) id<CityManagerDelegate> delegate;

- (void)fetchCities:(NSString*)city;


@end
