//
//  UIView+WRAAdditions.h
//  Dutch Bros.
//
//  Created by Logan Holmes on 3/6/13.
//  Copyright (c) 2013 WellRedApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WRAAdditions)

@property (nonatomic, assign) CGPoint frameOrigin;
@property (nonatomic, assign) CGSize frameSize;
@property (nonatomic, assign) CGFloat frameX;
@property (nonatomic, assign) CGFloat frameY;
@property (nonatomic, assign) CGFloat frameWidth;
@property (nonatomic, assign) CGFloat frameHeight;

@property (nonatomic, assign) CGPoint boundsOrigin;
@property (nonatomic, assign) CGSize boundsSize;
@property (nonatomic, assign) CGFloat boundsX;
@property (nonatomic, assign) CGFloat boundsY;
@property (nonatomic, assign) CGFloat boundsWidth;
@property (nonatomic, assign) CGFloat boundsHeight;

- (void)moveToCenterOfSuperview;
- (void)centerHorizontallyInSuperview;
- (void)centerVerticallyInSuperview;

@end
