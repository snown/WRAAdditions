//
//  NSString+WRAAdditions.h
//  Hustler Casino
//
//  Created by Logan Holmes on 5/8/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *NSStringFromBOOL(BOOL value);

@interface NSString (WRAAdditions)

- (NSNumber *)integerNumberValue;
- (NSUInteger)unsignedIntegerValue;

- (BOOL)containsString:(NSString *)subString;

@end
