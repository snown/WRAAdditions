//
//  NSString+WRACommonCryptoAdditions.m
//  Hustler Casino
//
//  Created by Logan Holmes on 11/16/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import "NSString+WRACommonCryptoAdditions.h"

@implementation NSString (WRACommonCryptoAdditions)

- (NSString *)md5HashValue {
	const char* str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
	
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
	
    return ret;
}

@end
