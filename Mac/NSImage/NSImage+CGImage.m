//
//  NSImage+CGImage.m
//  EdgeUp
//
//  Created by Logan Holmes on 8/16/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSImage+CGImage.h"

@implementation NSImage (CGImage_WRAAdditions)

- (CGImageRef)CGImage {
	NSBitmapImageRep *bitmapImageRep = [NSBitmapImageRep imageRepWithData:[self TIFFRepresentation]];
	return [bitmapImageRep CGImage];
}

@end
