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
+ (NSImage *)imageFromCIImage:(CIImage *)ciImage;
@end

