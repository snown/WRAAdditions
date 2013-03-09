//
//  NSNumber+WRAAdditions.h
//  Hustler Casino
//
//  Created by Logan Holmes on 10/3/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (WRAAdditions)

- (NSString *)boolString;

- (NSNumber *)numberByRoundingToNearestFraction:(double)decimalPoint;

@end
