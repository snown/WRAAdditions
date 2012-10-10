//
//  NSDate+WRAAdditions.m
//  Hustler Casino
//
//  Created by Logan Holmes on 10/10/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSDate+WRAAdditions.h"

@implementation NSDate (WRAAdditions)

- (NSDateComponents *)components:(NSCalendarUnit)calendarUnits {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *dateComponents = [calendar components:calendarUnits fromDate:self];
	
	return dateComponents;
}

@end
