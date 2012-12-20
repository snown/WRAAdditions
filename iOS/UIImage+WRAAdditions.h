//
//  UIImage+WRAAdditions.h
//
//  Created by Logan Holmes on 12/12/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WRAAdditions)

- (UIImage *)imageByTintingWithColor:(UIColor *)tintColor onDark:(BOOL)dark;
- (UIImage *)imageByTintingWithColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;

@end
