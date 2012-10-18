//
//  NSBezierPath+WRAAddidtions.h
//  EdgeUp
//
//  Created by Logan Holmes on 10/18/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSBezierPath (WRAAddidtions)

+ (id)bezierPathFromPointArray:(NSArray *)pointArray closed:(BOOL)closed;

@end
