//
//  NSArray+WRAAdditions.m
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

- (NSArray *)collapsedArrayUnique:(BOOL)unique {
	id newCollection;
	
	if (unique) {
		newCollection = [NSMutableOrderedSet orderedSet];
	} else {
		newCollection = [NSMutableArray array];
	}
	
	for (id object in self) {
		if ([object isKindOfClass:[NSArray class]]) {
			if (unique) {
				[(NSMutableOrderedSet *)newCollection unionOrderedSet:[NSOrderedSet orderedSetWithArray:[(NSArray *)object collapsedArrayUnique:unique]]];
			} else {
				[(NSMutableArray *)newCollection addObjectsFromArray:[(NSArray *)object collapsedArrayUnique:unique]];
			}
		} else {
			if (unique) {
				[(NSMutableOrderedSet *)newCollection unionOrderedSet:[NSOrderedSet orderedSetWithArray:self]];
			} else {
				[(NSMutableArray *)newCollection addObjectsFromArray:self];
			}
		}
	}
	
	if (unique) {
		newCollection = [(NSMutableOrderedSet *)newCollection array];
	}
	
	return newCollection;
}

- (id)firstObject {
	id result = nil;
	if ([self count] > 0) {
		result = [self objectAtIndex:0];
	}
	
	return result;
}

@end
