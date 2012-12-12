//
//  UITableView+WRAAdditions.m
//
//  Created by Logan Holmes on 12/12/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "UITableView+WRAAdditions.h"

@implementation UITableView (WRAAdditions)

- (BOOL)containsIndexPath:(NSIndexPath *)indexPath {
	BOOL result = YES;
	if ([self numberOfSections] > indexPath.section) {
		if (!([self numberOfRowsInSection:indexPath.section] > indexPath.row)) {
			result = NO;
		}
	} else {
		result = NO;
	}
	
	return result;
}

@end
