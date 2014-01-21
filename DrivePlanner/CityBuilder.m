//
//  CityBuilder.m
//  DrivePlanner
//
//  Created by Badari Madhav on 1/7/14.
//  Copyright (c) 2014 org.poobad. All rights reserved.
//

#import "CityBuilder.h"
#import "City.h"

@implementation CityBuilder

+ (NSArray *)citiesFromJSON:(NSData *)objectNotation error:(NSError **)error {
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *cities = [[NSMutableArray alloc] init];
    
    
    NSLog(@"Count %d", parsedObject.count);
    NSInteger index = 0;
    for (NSDictionary *cityName in parsedObject) {
       
//        City *city = [[City alloc] init];
//        
//        [city setName:(NSString*)cityName];
        
        [cities addObject:cityName];
        
    }
    
    return cities;
}

@end
