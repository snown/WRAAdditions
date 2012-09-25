//
//  NSArray+WRAAdditions.m
//  MCE2012
//
//  Created by Logan Holmes on 9/18/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSArray+WRAAdditions.h"

@implementation NSArray (WRAAdditions)

+ (id)arrayFromObject:(id)anObject {
	if (anObject) {
		if (![anObject isKindOfClass:[NSArray class]]) {
			anObject = [NSArray arrayWithObject:anObject];
		}
	}
	
	return anObject;
}

@end
