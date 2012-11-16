//
//  NSImageView+WRAAdditions.m
//  EdgeUp
//
//  Created by Logan Holmes on 10/17/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSImageView+WRAAdditions.h"

@implementation NSImageView (WRAAdditions)

- (NSRect)imageFrameParentContext:(BOOL)parentContext {
	// TODO: Check if calling a image rect method on the imageView.cell object would be better than the drawingRect method
	NSRect imageViewFrame;
	if (parentContext) {
		imageViewFrame = self.frame;
	} else {
		imageViewFrame = self.bounds;
	}
	
	// Determine max possible rect for the image in the cell
	//		It is my understanding that the "drawingRect" is the area where the cell can draw,
	//		and the imageRect may be some sub-rect of the drawing rect if the cell supports a title or other objects
	NSRect cellDrawingRect = [self.cell drawingRectForBounds:imageViewFrame];
	NSRect cellImageRect = [self.cell imageRectForBounds:cellDrawingRect];
	
	// Set the base size and origin for the imageRect
	NSRect imageRect = cellImageRect;
	imageRect.size = [self.image size];
	
	// Calculate ratio of the image, and determine which dimentsion is bigger
	double imageRatio = (imageRect.size.width / imageRect.size.height);
	BOOL imageWidthLargerThanHeight;
	if (imageRatio >= 0) {
		imageWidthLargerThanHeight = YES;
	} else {
		imageWidthLargerThanHeight = NO;
	}
	
	// Perform rect adjustments based on imageScaling, and the size of the image's dimentions
	NSUInteger scaling = [self imageScaling];
	if (scaling == NSImageScaleProportionallyDown) {
		if (imageWidthLargerThanHeight) {
			if (imageRect.size.width > cellImageRect.size.width) {
				imageRect.size.width = cellImageRect.size.width;
				imageRect.size.height = imageRect.size.width / imageRatio;
			}
			
			if (imageRect.size.height > cellImageRect.size.height) {
				imageRect.size.height = cellImageRect.size.height;
				imageRect.size.width = imageRect.size.height * imageRatio;
			}
		} else {
			if (imageRect.size.height > cellImageRect.size.height) {
				imageRect.size.height = cellImageRect.size.height;
				imageRect.size.width = imageRect.size.height * imageRatio;
			}
			
			if (imageRect.size.width > cellImageRect.size.width) {
				imageRect.size.width = cellImageRect.size.width;
				imageRect.size.height = imageRect.size.width / imageRatio;
			}
		}
	} else if (scaling == NSImageScaleProportionallyUpOrDown) {
		if (imageWidthLargerThanHeight) {
			if (imageRect.size.width != cellImageRect.size.width) {
				imageRect.size.width = cellImageRect.size.width;
				imageRect.size.height = imageRect.size.width / imageRatio;
			}
			
			if (imageRect.size.height > cellImageRect.size.height) {
				imageRect.size.height = cellImageRect.size.height;
				imageRect.size.width = imageRect.size.height * imageRatio;
			}
		} else {
			if (imageRect.size.height != cellImageRect.size.height) {
				imageRect.size.height = cellImageRect.size.height;
				imageRect.size.width = imageRect.size.height * imageRatio;
			}
			
			if (imageRect.size.width > cellImageRect.size.width) {
				imageRect.size.width = cellImageRect.size.width;
				imageRect.size.height = imageRect.size.width / imageRatio;
			}
		}
	} else if (scaling == NSImageScaleAxesIndependently) {
		imageRect.size = cellImageRect.size;
	}
	// NSImageScaleNone keeps the size the same, so no adjustment is neccesary
	
	// Center the image in the drawing frame
	imageRect.origin.x += (cellImageRect.size.width - imageRect.size.width) / 2;
	imageRect.origin.y += (cellImageRect.size.height - imageRect.size.height) / 2;
	
	return imageRect;
}

- (NSPoint)convertImagePointToView:(NSPoint)aPoint {
	NSRect imageRect = [self imageFrameParentContext:NO];
	NSRect viewRect = self.bounds;
	
	NSPoint newPoint = aPoint;
	
	newPoint.x += viewRect.origin.x - imageRect.origin.x;
	newPoint.y += viewRect.origin.y - imageRect.origin.y;
	
	return newPoint;
}

- (NSPoint)convertViewPointToImage:(NSPoint)aPoint {
	NSRect imageRect = [self imageFrameParentContext:NO];
	NSRect viewRect = self.bounds;
	
	NSPoint newPoint = aPoint;
	
	newPoint.x -= viewRect.origin.x - imageRect.origin.x;
	newPoint.y -= viewRect.origin.y - imageRect.origin.y;
	
	return newPoint;
}

@end
