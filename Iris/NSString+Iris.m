//
//  NSString+Iris.m
//  Iris
//
//  Created by Jonathan Baker on 11/11/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

#import "NSString+Iris.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Iris)

- (NSString *)__iris_MD5Digest {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];

    void *digestBuffer = malloc(CC_MD5_DIGEST_LENGTH);
    CC_MD5(data.bytes, (CC_LONG) data.length, digestBuffer);
    NSData *digest = [NSData dataWithBytesNoCopy:digestBuffer length:CC_MD5_DIGEST_LENGTH];

    NSMutableString *builder = [[NSMutableString alloc] init];
    const unsigned char *buffer = digest.bytes;
    for (NSInteger i = 0; i < digest.length; i++) {
        [builder appendFormat:@"%02x", buffer[i]];
    }
    return builder;
}

@end
