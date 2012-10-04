//
//  NSCalendar+WRAAdditions.m
//  Hustler Casino
//
//  Created by Logan Holmes on 7/3/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSCalendar+WRAAdditions.h"

@implementation NSCalendar (WRAAdditions)

- (NSInteger)lastDayOfMonth:(NSInteger)aMonth year:(NSInteger)aYear {
	NSRange monthRange = [self rangeOfDaysInMonth:aMonth year:aYear];
	return monthRange.length;
}

- (NSRange)rangeOfDaysInMonth:(NSInteger)aMonth year:(NSInteger)aYear {
	NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
	[dateComponents setYear:aYear];
	[dateComponents setMonth:aMonth];
	[dateComponents setDay:1];
	
	return [self rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[self dateFromComponents:dateComponents]];
}

@end
