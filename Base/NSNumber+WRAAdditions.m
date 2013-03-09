//
//  NSNumber+WRAAdditions.m
//  Hustler Casino
//
//  Created by Logan Holmes on 10/3/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSNumber+WRAAdditions.h"

@implementation NSNumber (WRAAdditions)

- (NSString *)boolString {
	if ([self boolValue]) {
		return @"YES";
	} else {
		return @"NO";
	}
}

- (NSNumber *)numberByRoundingToNearestFraction:(double)decimalPoint {
	if (decimalPoint >= 1) {
		double major = floor(decimalPoint);
		decimalPoint -= major;
	}
	if (decimalPoint < 0) {
		decimalPoint = fabs(decimalPoint);
	}
	
	double myself = [self doubleValue];
	myself = myself * (1/decimalPoint);
	myself += decimalPoint;
	myself = floor(myself) * decimalPoint;
	
	return @(myself);
}

@end
