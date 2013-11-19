//
//  NSString+WRAAdditions.m
//  Hustler Casino
//
//  Created by Logan Holmes on 5/8/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSString+WRAAdditions.h"

NSString *NSStringFromBOOL(BOOL value) {
	if (value) {
		return @"YES";
	} else {
		return @"NO";
	}
}

@implementation NSString (WRAAdditions)

- (NSNumber *)integerNumberValue {
	return [NSNumber numberWithInteger:[self integerValue]];
}

- (NSUInteger)unsignedIntegerValue {
	NSNumber *aNumber = [self integerNumberValue];
	return [aNumber unsignedIntegerValue];
}

- (BOOL)containsString:(NSString *)subString {
	if ([self rangeOfString:subString].location != NSNotFound) {
		return YES;
	} else {
		return NO;
	}
}

@end
