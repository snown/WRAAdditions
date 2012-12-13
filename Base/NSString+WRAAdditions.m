//
//  NSString+WRAAdditions.m
//  Hustler Casino
//
//  Created by Logan Holmes on 5/8/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSString+WRAAdditions.h"

@implementation NSString (WRAAdditions)

- (NSNumber *)integerNumberValue {
	return [NSNumber numberWithInteger:[self integerValue]];
}

- (NSUInteger)unsignedIntegerValue {
	NSNumber *aNumber = [self integerNumberValue];
	return [aNumber unsignedIntegerValue];
}

@end
