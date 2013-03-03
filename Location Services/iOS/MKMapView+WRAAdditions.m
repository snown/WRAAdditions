//
//  MKMapView+WRAAdditions.m
//  Dutch Bros.
//
//  Created by Logan Holmes on 11/24/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "MKMapView+WRAAdditions.h"

@implementation MKMapView (WRAAdditions)

- (MKMapRect)rectThatFitsAnnotations:(NSArray *)someAnnotations withLocation:(CLLocation *)aLocation centered:(BOOL)centered {
	MKMapRect zoomRect = MKMapRectNull;
	if (aLocation) {
		MKMapPoint locationPoint = MKMapPointForCoordinate(aLocation.coordinate);
		zoomRect = MKMapRectMake(locationPoint.x, locationPoint.y, 0, 0);
	}
	
	for (id<MKAnnotation> annotation in someAnnotations) {
		MKMapPoint mapPoint = MKMapPointForCoordinate([annotation coordinate]);
		MKMapRect pointRect = MKMapRectMake(mapPoint.x, mapPoint.y, 0.0, 0.0);
		if (MKMapRectIsNull(zoomRect)) {
			zoomRect = pointRect;
		} else {
			zoomRect = MKMapRectUnion(zoomRect, pointRect);
		}
	}
	
	if (aLocation && centered) {
		MKMapPoint locationPoint = MKMapPointForCoordinate(aLocation.coordinate);
		double xDelta = locationPoint.x - zoomRect.origin.x;
		double widthDelta = MKMapRectGetMaxX(zoomRect) - locationPoint.x;
		double yDelta = locationPoint.y - MKMapRectGetMinY(zoomRect);
		double heightDelta = MKMapRectGetMaxY(zoomRect)	- locationPoint.y;
		
		if (xDelta < widthDelta) {
			zoomRect.origin.x -= (widthDelta - xDelta);
		} else {
			zoomRect.size.width += (xDelta - widthDelta);
		}
		
		if (yDelta < heightDelta) {
			zoomRect.origin.y -= (heightDelta - yDelta);
		} else {
			zoomRect.size.height += (yDelta - heightDelta);
		}
	}
	
	return zoomRect;
}

- (MKMapRect)rectThatFitsAnnotations:(NSArray *)someAnnotations {
	return [self rectThatFitsAnnotations:someAnnotations withLocation:nil centered:NO];
}

- (MKCoordinateRegion)coordinateRegionThatFitsAnnotations:(NSArray *)someAnnotations andLocation:(CLLocation *)aLocation withSpanPadding:(double)padding {
	MKMapRect rect = [self rectThatFitsAnnotations:someAnnotations withLocation:aLocation centered:NO];
	
	MKCoordinateRegion resultRegion = MKCoordinateRegionForMapRect(rect);
	resultRegion.span.latitudeDelta += padding;
	resultRegion.span.longitudeDelta += padding;
	
	return resultRegion;
}

@end
