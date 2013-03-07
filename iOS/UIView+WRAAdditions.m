//
//  UIView+WRAAdditions.m
//  Dutch Bros.
//
//  Created by Logan Holmes on 3/6/13.
//  Copyright (c) 2013 WellRedApps. All rights reserved.
//

#import "UIView+WRAAdditions.h"

@implementation UIView (WRAAdditions)

- (void)moveToCenterOfSuperview {
	if (self.superview) {
		self.center = self.superview.center;
	}
}

- (void)centerHorizontallyInSuperview {
	if (self.superview) {
		CGPoint point = self.center;
		point.y = self.superview.center.y;
		self.center = point;
	}
}

- (void)centerVerticallyInSuperview {
	if (self.superview) {
		CGPoint point = self.center;
		point.x = self.superview.center.x;
		self.center = point;
	}
}

#
#pragma mark - Accessors
#
- (CGPoint)frameOrigin {
	return self.frame.origin;
}

- (void)setFrameOrigin:(CGPoint)frameOrigin {
	CGRect rect = self.frame;
	rect.origin = frameOrigin;
	self.frame = rect;
}

- (CGSize)frameSize {
	return self.frame.size;
}

- (void)setFrameSize:(CGSize)frameSize {
	CGRect rect = self.frame;
	rect.size = frameSize;
	self.frame = rect;
}

- (CGFloat)frameX {
	return self.frame.origin.x;
}

- (void)setFrameX:(CGFloat)frameX {
	CGRect rect = self.frame;
	rect.origin.x = frameX;
	self.frame = rect;
}

- (CGFloat)frameY {
	return self.frame.origin.y;
}

- (void)setFrameY:(CGFloat)frameY {
	CGRect rect = self.frame;
	rect.origin.y = frameY;
	self.frame = rect;
}

- (CGFloat)frameWidth {
	return self.frame.size.width;
}

- (void)setFrameWidth:(CGFloat)frameWidth {
	CGRect rect = self.frame;
	rect.size.width = frameWidth;
	self.frame = rect;
}

- (CGFloat)frameHeight {
	return self.frame.size.height;
}

- (void)setFrameHeight:(CGFloat)frameHeight {
	CGRect rect = self.frame;
	rect.size.height = frameHeight;
	self.frame = rect;
}

- (CGPoint)boundsOrigin {
	return self.bounds.origin;
}

- (void)setBoundsOrigin:(CGPoint)boundsOrigin {
	CGRect rect = self.bounds;
	rect.origin = boundsOrigin;
	self.bounds = rect;
}

- (CGSize)boundsSize {
	return self.bounds.size;
}

- (void)setBoundsSize:(CGSize)boundsSize {
	CGRect rect = self.bounds;
	rect.size = boundsSize;
	self.bounds = rect;
}

- (CGFloat)boundsX {
	return self.bounds.origin.x;
}

- (void)setBoundsX:(CGFloat)boundsX {
	CGRect rect = self.bounds;
	rect.origin.x = boundsX;
	self.bounds = rect;
}

- (CGFloat)boundsY {
	return self.bounds.origin.y;
}

- (void)setBoundsY:(CGFloat)boundsY {
	CGRect rect = self.bounds;
	rect.origin.y = boundsY;
	self.bounds = rect;
}

- (CGFloat)boundsWidth {
	return self.bounds.size.width;
}

- (void)setBoundsWidth:(CGFloat)boundsWidth {
	CGRect rect = self.bounds;
	rect.size.width = boundsWidth;
	self.bounds = rect;
}

- (CGFloat)boundsHeight {
	return self.bounds.size.height;
}

- (void)setBoundsHeight:(CGFloat)boundsHeight {
	CGRect rect = self.bounds;
	rect.size.height = boundsHeight;
	self.bounds = rect;
}

@end
