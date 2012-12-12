//
//  UITableViewCell+WRAAdditions.m
//
//  Created by Logan Holmes on 12/12/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "UITableViewCell+WRAAdditions.h"

@implementation UITableViewCell (WRAAdditions)

+ (id)cellFromNibNamed:(NSString *)nibName owner:(id)owner {
	NSArray *results = [[NSBundle mainBundle] loadNibNamed:nibName owner:owner options:nil];
	UITableViewCell *cell;
	for (id object in results) {
		if ([object isKindOfClass:[UITableViewCell class]]) {
			cell = object;
			break;
		}
	}
	
	return cell;
}

@end
