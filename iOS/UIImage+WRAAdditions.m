//
//  UIImage+WRAAdditions.m
//
//  Created by Logan Holmes on 12/12/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "UIImage+WRAAdditions.h"

@implementation UIImage (WRAAdditions)

- (UIImage *)imageByTintingWithColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode {
	// This code is thanks to "fabb" on StackOverflow - http://stackoverflow.com/a/7377827/327471
	
	// Prepare UIImage
	UIGraphicsBeginImageContext(self.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextTranslateCTM(context, 0.0, self.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	CGRect rect = CGRectMake(0.0, 0.0, self.size.width, self.size.height);
	
	// draw black background to preserve color of transparent pixels
	CGContextSetBlendMode(context, kCGBlendModeNormal);
	[[UIColor blackColor] setFill];
	CGContextFillRect(context, rect);
	
	// draw original image
	CGContextSetBlendMode(context, kCGBlendModeNormal);
	CGContextDrawImage(context, rect, self.CGImage);
	
	// tint image (loosing alpha) - the luminosity of the original image is preserved
	CGContextSetBlendMode(context, blendMode);
	[tintColor setFill];
	CGContextFillRect(context, rect);
	
	// mask by alpha values of original image
	CGContextSetBlendMode(context, kCGBlendModeDestinationIn);
	CGContextDrawImage(context, rect, self.CGImage);
	
	// Get new UIImage out
	UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return tintedImage;
}

- (UIImage *)imageByTintingWithColor:(UIColor *)tintColor onDark:(BOOL)dark {
	CGBlendMode blendMode;
	if (dark) {
		blendMode = kCGBlendModeColor;
	} else {
		blendMode = kCGBlendModeMultiply;
	}
	
	return [self imageByTintingWithColor:tintColor blendMode:blendMode];
}

@end
