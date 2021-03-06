//
//  NSImageView+WRAAdditions.h
//  EdgeUp
//
//  Created by Logan Holmes on 10/17/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImageView (WRAAdditions)

- (NSRect)imageFrameParentContext:(BOOL)parentContext;
- (NSPoint)convertImagePointToView:(NSPoint)aPoint;
- (NSPoint)convertViewPointToImage:(NSPoint)aPoint;

@end
