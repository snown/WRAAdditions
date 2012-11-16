//
//  NSString+WRACommonCryptoAdditions.h
//  Hustler Casino
//
//  Created by Logan Holmes on 11/16/12.
//  Copyright (c) 2012 WellRedApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

@interface NSString (WRACommonCryptoAdditions)

- (NSString *)md5HashValue;

@end
