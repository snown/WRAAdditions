//
//  NSArray+WRAAdditions.h
//
//  Created by Logan Holmes on 9/18/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (WRAAdditions)

+ (id)arrayFromObject:(id)anObject;

- (NSArray *)collapsedArrayUnique:(BOOL)unique;

- (id)firstObject;

@end
