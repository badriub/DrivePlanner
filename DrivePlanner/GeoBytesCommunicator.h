//
//  GeoBytesCommunicator.h
//  DrivePlanner
//
//  Created by Badari Madhav on 1/7/14.
//  Copyright (c) 2014 org.poobad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol GeoBytesCommunicatorDelegate;

@interface GeoBytesCommunicator : NSObject

@property (weak, nonatomic) id<GeoBytesCommunicatorDelegate> delegate;

- (void)searchCities:(NSString*)city;

@end
