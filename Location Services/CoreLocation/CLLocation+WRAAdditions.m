//
//  CLLocation+WRAAdditions.m
//  Meander
//
//  Created by Logan Holmes on 9/6/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "CLLocation+WRAAdditions.h"

@implementation CLLocation (WRAAdditions)

+ (id)locationWithCoordinate:(CLLocationCoordinate2D)aCoordinate {
	return [(CLLocation *)[self alloc] initWithLatitude:aCoordinate.latitude longitude:aCoordinate.longitude];
}

@end
