//
//  NSDate+WRAAdditions.h
//  Hustler Casino
//
//  Created by Logan Holmes on 10/10/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
	WRADateCompareSame = NSOrderedSame,
	WRADateCompareEarlier = NSOrderedAscending,
	WRADateCompareLater = NSOrderedDescending
};

@interface NSDate (WRAAdditions)

- (NSDateComponents *)components:(NSCalendarUnit)calendarUnits;

@end
