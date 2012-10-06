//
//  NSDateComponents+WRAAdditions.h
//  Hustler Casino
//
//  Created by Logan Holmes on 10/5/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateComponents (WRAAdditions)

+ (id)dateComponentsFromCalendar:(NSCalendar *)aCalendar year:(NSInteger)aYear month:(NSInteger)aMonth day:(NSInteger)aDay;

@end
