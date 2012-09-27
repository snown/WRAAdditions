//
//  NSImage+CIImage.m
//  EdgeUp
//
//  Created by Logan Holmes on 8/15/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSImage+CIImage.h"

@implementation NSImage (CIImage)
// Thanks to Petteri Kamppuri
// http://theocacao.com/document.page/350/
+ (NSImage *)imageFromCIImage:(CIImage *)ciImage {
	NSImage *image = [[NSImage alloc] initWithSize:NSMakeSize([ciImage extent].size.width, [ciImage extent].size.height)];
#if !__has_feature(objc_arc)
	[image autorelease];
#endif
	[image addRepresentation:[NSCIImageRep imageRepWithCIImage:ciImage]];
	return image;
}

@end
