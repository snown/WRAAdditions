//
//  NSImage+CIImage.h
//  EdgeUp
//
//  Created by Logan Holmes on 8/15/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>
#import <QuartzCore/QuartzCore.h>

@interface NSImage (CIImage)
+ (NSImage *)imageWithCIImage:(CIImage *)i fromRect:(CGRect)r;
+ (NSImage *)imageWithCIImage:(CIImage *)i;
- (NSImage *) crop:(CGRect) cropRect;
- (NSImage *) imageFromRect: (NSRect) rect; //alternative to crop
- (CIImage *)newCIImage;
-(CGImageRef)newCGImageRef;
+ (NSImage *)newImageWithCGImageRef:(CGImageRef)cgImage;
- (NSImage *)cropAlpha:(int)buffer;
@end

@interface NSBitmapImageRep (CIImage)
+ (NSBitmapImageRep *)imageRepWithCIImage:(CIImage *)i fromRect:(CGRect)r;
+ (NSBitmapImageRep *)imageRepWithCIImage:(CIImage *)i;
@end