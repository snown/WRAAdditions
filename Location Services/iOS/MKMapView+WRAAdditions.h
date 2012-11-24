//
//  MKMapView+WRAAdditions.h
//  Dutch Bros.
//
//  Created by Logan Holmes on 11/24/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (WRAAdditions)

- (MKMapRect)rectThatFitsAnnotations:(NSArray *)someAnnotations withLocation:(CLLocation *)aLocation centered:(BOOL)centered;
- (MKMapRect)rectThatFitsAnnotations:(NSArray *)someAnnotations;

@end
