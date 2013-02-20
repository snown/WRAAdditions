//
//  NSSet+WRAAdditions.m
//  Dutch Bros.
//
//  Created by Logan Holmes on 2/19/13.
//  Copyright (c) 2013 WellRedApps. All rights reserved.
//

#import "NSSet+WRAAdditions.h"

@implementation NSSet (WRAAdditions)

- (NSSet *)collapsedSet {
	NSMutableSet *newSet = [NSMutableSet set];
	for (id object in self) {
		if ([object isKindOfClass:[NSSet class]]) {
			[newSet unionSet:[self collapsedSet]];
		} else {
			[newSet unionSet:self];
		}
	}
	
	return newSet;
}

@end
