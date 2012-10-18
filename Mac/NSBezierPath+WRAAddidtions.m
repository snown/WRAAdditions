//
//  NSBezierPath+WRAAddidtions.m
//  EdgeUp
//
//  Created by Logan Holmes on 10/18/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSBezierPath+WRAAddidtions.h"

@implementation NSBezierPath (WRAAddidtions)

+ (id)bezierPathFromPointArray:(NSArray *)pointArray closed:(BOOL)closed {
#ifdef UNDEBUG
	NSLog(@"%s [Line %d]\nPointArray:\n%@", __PRETTY_FUNCTION__, __LINE__, pointArray);
#endif
	
	NSBezierPath *path = [self bezierPath];
	NSPoint firstPoint = [(NSValue *)[pointArray objectAtIndex:0] pointValue];
	[path moveToPoint:firstPoint];
	
	for (int pointIndex = 1; pointIndex < [pointArray count]; pointIndex++) {
		NSPoint point = [(NSValue *)[pointArray objectAtIndex:pointIndex] pointValue];
		[path lineToPoint:point];
	}
	
	if (closed) {
		[path closePath];
	}
	
	return path;
}

@end
