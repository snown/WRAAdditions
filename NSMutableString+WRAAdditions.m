//
//  NSMutableString+WRAAdditions.m
//  Hustler Casino
//
//  Created by Logan Holmes on 7/3/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSMutableString+WRAAdditions.h"

@implementation NSMutableString (WRAAdditions)

- (void)trimCharactersInSet:(NSCharacterSet *)set {
	[self setString:[self stringByTrimmingCharactersInSet:set]];
}

@end
