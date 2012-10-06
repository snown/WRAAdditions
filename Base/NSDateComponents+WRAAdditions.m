//
//  NSDateComponents+WRAAdditions.m
//  Hustler Casino
//
//  Created by Logan Holmes on 10/5/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSDateComponents+WRAAdditions.h"

@implementation NSDateComponents (WRAAdditions)

+ (id)dateComponentsFromCalendar:(NSCalendar *)aCalendar year:(NSInteger)aYear month:(NSInteger)aMonth day:(NSInteger)aDay {
	NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
	if (aCalendar) {
		[dateComponents setCalendar:aCalendar];
	}
	
	// 0 is not a valid year
	if (aYear) {
		[dateComponents setYear:aYear];
	}
	
	// 0 is not a valid month
	if (aMonth) {
		[dateComponents setMonth:aMonth];
	}
	
	// 0 is not a valid day
	if (aDay) {
		[dateComponents setDay:aDay];
	}
	
	return dateComponents;
}

@end
