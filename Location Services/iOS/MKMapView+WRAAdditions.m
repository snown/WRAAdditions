//
//  MKMapView+WRAAdditions.m
//  Dutch Bros.
//
//  Created by Logan Holmes on 11/24/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "MKMapView+WRAAdditions.h"

@implementation MKMapView (WRAAdditions)

- (MKMapRect)rectThatFitsAnnotations:(NSArray *)someAnnotations {
	MKMapRect zoomRect = MKMapRectNull;
	for (id<MKAnnotation> annotation in someAnnotations) {
		MKMapPoint mapPoint = MKMapPointForCoordinate([annotation coordinate]);
		MKMapRect pointRect = MKMapRectMake(mapPoint.x, mapPoint.y, 0.0, 0.0);
		if (MKMapRectIsNull(zoomRect)) {
			zoomRect = pointRect;
		} else {
			zoomRect = MKMapRectUnion(zoomRect, pointRect);
		}
	}
	
	return zoomRect;
}

@end
