//
//  NSEvent+WRAAditions.m
//  EdgeUp
//
//  Created by Logan Holmes on 10/11/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSEvent+WRAAditions.h"

enum EventMouseDown {
	kEventMouseDownLeft = 1 << 0,
	kEventMouseDownRight = 1 << 1
};

@implementation NSEvent (WRAAditions)

+ (BOOL)leftMouseDown {
	return [NSEvent pressedMouseButtons] & kEventMouseDownLeft;
}

+ (BOOL)rightMouseDown {
	return [NSEvent pressedMouseButtons] & kEventMouseDownRight;
}

@end
