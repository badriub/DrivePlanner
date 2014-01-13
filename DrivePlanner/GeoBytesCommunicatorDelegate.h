//
//  GeoBytesCommunicatorDelegate.h
//  DrivePlanner
//
//  Created by Badari Madhav on 1/7/14.
//  Copyright (c) 2014 org.poobad. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GeoBytesCommunicatorDelegate <NSObject>

- (void)receivedCitiesJSON:(NSData *)objectNotation;
- (void)fetchingCitiesFailedWithError:(NSError *)error;

@end