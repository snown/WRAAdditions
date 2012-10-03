//
//  NSNumber+WRAAdditions.m
//  Hustler Casino
//
//  Created by Logan Holmes on 10/3/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSNumber+WRAAdditions.h"

@implementation NSNumber (WRAAdditions)

- (NSString *)boolString {
	if ([self boolValue]) {
		return @"YES";
	} else {
		return @"NO";
	}
}

@end
