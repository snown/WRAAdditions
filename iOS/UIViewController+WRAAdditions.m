//
//  UIViewController+WRAAdditions.m
//  GeoPush
//
//  Created by Logan Holmes on 10/8/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "UIViewController+WRAAdditions.h"

@implementation UIViewController (WRAAdditions)

- (UIView *)swapInViewController:(UIViewController *)newSubviewController forView:(UIView *)aSubview {
	newSubviewController.view.frame = aSubview.frame;
	// TODO: Change this to check for Autolayout/Constraints
	newSubviewController.view.autoresizingMask = aSubview.autoresizingMask;
	[aSubview removeFromSuperview];
	[self.view addSubview:newSubviewController.view];
	
	return newSubviewController.view;
}

@end
