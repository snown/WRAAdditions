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
	
	NSRect drawingRect = [self.cell drawingRectForBounds:imageViewFrame];
	NSRect imageRect = drawingRect;
	imageRect.size = [self.image size];
	
	double imageRatio = (imageRect.size.width / imageRect.size.height);
	
	BOOL imageWidthLargerThanHeight;
	if (imageRatio >= 0) {
		imageWidthLargerThanHeight = YES;
	} else {
		imageWidthLargerThanHeight = NO;
	}
	
	NSUInteger scaling = [self imageScaling];
	
	if (scaling == NSImageScaleProportionallyDown) {
		if (imageWidthLargerThanHeight) {
			if (imageRect.size.width > drawingRect.size.width) {
				imageRect.size.width = drawingRect.size.width;
				imageRect.size.height = imageRect.size.width / imageRatio;
			}
			
			if (imageRect.size.height > drawingRect.size.height) {
				imageRect.size.height = drawingRect.size.height;
				imageRect.size.width = imageRect.size.height * imageRatio;
			}
		} else {
			if (imageRect.size.height > drawingRect.size.height) {
				imageRect.size.height = drawingRect.size.height;
				imageRect.size.width = imageRect.size.height * imageRatio;
			}
			
			if (imageRect.size.width > drawingRect.size.width) {
				imageRect.size.width = drawingRect.size.width;
				imageRect.size.height = imageRect.size.width / imageRatio;
			}
		}
	} else if (scaling == NSImageScaleProportionallyUpOrDown) {
		if (imageWidthLargerThanHeight) {
			if (imageRect.size.width != drawingRect.size.width) {
				imageRect.size.width = drawingRect.size.width;
				imageRect.size.height = imageRect.size.width / imageRatio;
			}
			
			if (imageRect.size.height > drawingRect.size.height) {
				imageRect.size.height = drawingRect.size.height;
				imageRect.size.width = imageRect.size.height * imageRatio;
			}
		} else {
			if (imageRect.size.height != drawingRect.size.height) {
				imageRect.size.height = drawingRect.size.height;
				imageRect.size.width = imageRect.size.height * imageRatio;
			}
			
			if (imageRect.size.width > drawingRect.size.width) {
				imageRect.size.width = drawingRect.size.width;
				imageRect.size.height = imageRect.size.width / imageRatio;
			}
		}
	} else if (scaling == NSImageScaleAxesIndependently) {
		imageRect.size = drawingRect.size;
	}
	
	imageRect.origin.x += (drawingRect.size.width - imageRect.size.width) / 2;
	imageRect.origin.y += (drawingRect.size.height - imageRect.size.height) / 2;
	
	return imageRect;
}

@end
