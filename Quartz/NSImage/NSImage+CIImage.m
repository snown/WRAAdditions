//
//  NSImage+CIImage.m
//  EdgeUp
//
//  Created by Logan Holmes on 8/15/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSImage+CIImage.h"

@implementation NSImage (CIImage)
+ (NSImage *)imageWithCIImage:(CIImage *)i fromRect:(CGRect)r
{
	NSImage *image;
	NSCIImageRep *ir;
	
	ir = [NSCIImageRep imageRepWithCIImage:i];
	image = [[[NSImage alloc] initWithSize:
			  NSMakeSize(r.size.width, r.size.height)]
			 autorelease];
	[image addRepresentation:ir];
	return image;
}

+ (NSImage *)imageWithCIImage:(CIImage *)i
{
	return [self imageWithCIImage:i fromRect:[i extent]];
}

+ (NSImage *)newImageWithCGImageRef:(CGImageRef)cgImage
{
	NSBitmapImageRep *bitmapRep = [[NSBitmapImageRep alloc] initWithCGImage:cgImage];
	NSImage *image = [[NSImage alloc] init];
	[image addRepresentation:bitmapRep];
	[bitmapRep release];
	return image;
}


- (CIImage *)newCIImage
{
	return [[CIImage alloc] initWithBitmapImageRep:[NSBitmapImageRep imageRepWithData:[self TIFFRepresentation]]];
}

-(CGImageRef)newCGImageRef
{
	NSData* cocoaData = [NSBitmapImageRep TIFFRepresentationOfImageRepsInArray: [self representations]];
	CFDataRef carbonData = (CFDataRef)cocoaData;
	CGImageSourceRef imageSourceRef = CGImageSourceCreateWithData(carbonData, NULL);
	CGImageRef out = CGImageSourceCreateImageAtIndex(imageSourceRef, 0, NULL);
	CFRelease(imageSourceRef);
	return out;
}

- (NSImage *) crop:(CGRect) cropRect{
	CGImageRef imageRef = CGImageCreateWithImageInRect([self newCGImageRef], cropRect);
	NSImage* ret = [NSImage newImageWithCGImageRef:imageRef];
	CGImageRelease(imageRef);
	return ret;
}



- (NSImage *) imageFromRect: (NSRect) rect
{
    NSAffineTransform * xform = [NSAffineTransform transform];
	
	int y = rect.size.width - (rect.origin.y + rect.size.height);
	
	
	
	NSRect oldRect = NSMakeRect(rect.origin.x, y, rect.size.width, rect.size.height);
	NSRect newRect = NSMakeRect(0, 0, rect.size.width, rect.size.height);
	
    // translate reference frame to map rectangle 'rect' into first quadrant
	//    [xform translateXBy: -rect.origin.x
	//                    yBy: -rect.origin.y];
	//    NSSize canvas_size = [xform transformSize: rect.size];
	
    NSImage * canvas = [[NSImage alloc] initWithSize: newRect.size];
    [canvas lockFocus];
	
	//    [xform concat];
    
    // Get NSImageRep of image
	//    NSImageRep * rep = [self bestRepresentationForDevice: nil];
	
    [self drawInRect:newRect fromRect:oldRect operation:NSCompositeCopy fraction:1.0];
    
    [canvas unlockFocus];
    return [canvas autorelease];
	//      return self;
}



- (NSImage *)cropAlpha:(int)buffer{
	
	if([[self representations] count] == 0) return 0;
	
	NSData  * tiffData = [self TIFFRepresentation];
	NSBitmapImageRep* bitRep = [NSBitmapImageRep imageRepWithData:tiffData];
	
	int minH = 0;
	int maxH = self.size.height;
	int i;
	CGPoint p = CGPointMake(0, 0);
	for(i=0;i<maxH;i++){
		p.x = self.size.width / 2;
		p.y = i;
		if([bitRep alphaAt:p] == 0){
			minH = i;
		}else{
			break;
		}
	}
	for(i=self.size.height;i>0;i--){
		p.x = self.size.width / 2;
		p.y = i;
		if([bitRep alphaAt:p] == 0){
			maxH = i;
		}else{
			break;
		}
	}
	minH -= buffer;
	maxH += buffer;
	if(minH < 0) minH = 0;
	if(maxH > self.size.height) maxH = self.size.height;
	if(minH > maxH) maxH = minH;
	
	NSRect cropRect = NSMakeRect(0,minH,self.size.width,maxH - minH);
	return [self imageFromRect:cropRect];
}

@end

@implementation NSBitmapImageRep (CICreation)
+ (NSBitmapImageRep *)imageRepWithCIImage:(CIImage *)i fromRect:(CGRect)r
{
	
	// Create a new NSBitmapImageRep.
	NSBitmapImageRep *rep = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:NULL pixelsWide:r.size.width pixelsHigh:r.size.height bitsPerSample:8 samplesPerPixel:4 hasAlpha:YES isPlanar:NO colorSpaceName:NSDeviceRGBColorSpace bytesPerRow:0 bitsPerPixel:0];
	
	// Create an NSGraphicsContext that draws into the NSBitmapImageRep. (This capability is new in Tiger.)
	NSGraphicsContext *nsContext = [NSGraphicsContext graphicsContextWithBitmapImageRep:rep];
	
	// Save the previous graphics context and state, and make our bitmap context current.
	[NSGraphicsContext saveGraphicsState];
	[NSGraphicsContext setCurrentContext: nsContext];
	
	// Get a CIContext from the NSGraphicsContext, and use it to draw the CIImage into the NSBitmapImageRep.
	[[nsContext CIContext] drawImage:i atPoint:CGPointZero fromRect:r];
	
	// Restore the previous graphics context and state.
	[NSGraphicsContext restoreGraphicsState];
	
	return [rep autorelease];
}

+ (NSBitmapImageRep *)imageRepWithCIImage:(CIImage *)i
{
	return [self imageRepWithCIImage:i fromRect:[i extent]];
}
@end
