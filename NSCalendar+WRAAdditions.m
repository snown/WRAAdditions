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
	NSDateComponents *testComponents = [[NSDateComponents alloc] init];
	[testComponents setYear:aYear];
	[testComponents setMonth:aMonth];
	[testComponents setDay:1];
	
	NSRange monthRange = [self rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[self dateFromComponents:testComponents]];
	
	return monthRange.length;
}
@end
