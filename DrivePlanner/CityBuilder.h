//
//  CityBuilder.h
//  DrivePlanner
//
//  Created by Badari Madhav on 1/7/14.
//  Copyright (c) 2014 org.poobad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityBuilder : NSObject
+ (NSArray *)citiesFromJSON:(NSData *)objectNotation error:(NSError **)error;
@end
