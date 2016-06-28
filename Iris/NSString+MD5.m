//
//  NSString+MD5.m
//  Iris
//
//  Created by Jonathan Baker on 11/11/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (IrisMD5)

- (NSString *)iris_MD5 {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];

    void *digestBuffer = malloc(CC_MD5_DIGEST_LENGTH);
    CC_MD5(data.bytes, (CC_LONG)data.length, digestBuffer);
    NSData *digest = [NSData dataWithBytesNoCopy:digestBuffer length:CC_MD5_DIGEST_LENGTH];

    NSMutableString *builder = [[NSMutableString alloc] init];
    const unsigned char *buffer = digest.bytes;
    for (NSUInteger i = 0; i < digest.length; i++) {
        [builder appendFormat:@"%02x", buffer[i]];
    }
    return builder;
}

@end
