//
//  MD5.m
//  Iris
//
//  Created by Jonathan Baker on 11/11/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

#import "MD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSData (IrisMD5)

- (NSData *)__iris_MD5Digest {
    void *buffer = malloc(CC_MD5_DIGEST_LENGTH);
    CC_MD5(self.bytes, (CC_LONG) self.length, buffer);
    return [NSData dataWithBytesNoCopy:buffer length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)__iris_hexadecimalString {
    NSMutableString *builder = [[NSMutableString alloc] init];
    const unsigned char *buffer = self.bytes;
    for (NSInteger i = 0; i < self.length; i++) {
        [builder appendFormat:@"%02x", buffer[i]];
    }
    return builder;
}

@end

@implementation NSString (IrisMD5)

- (NSString *)__iris_MD5Digest {
    return [self dataUsingEncoding:NSUTF8StringEncoding].__iris_MD5Digest.__iris_hexadecimalString;
}

@end
