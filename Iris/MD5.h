//
//  MD5.h
//  Iris
//
//  Created by Jonathan Baker on 11/11/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface NSData (IrisMD5)
@property (nonatomic, readonly) NSData * __iris_MD5Digest;
@property (nonatomic, readonly) NSString * __iris_hexadecimalString;
@end

@interface NSString (IrisMD5)
@property (nonatomic, readonly, nullable) NSString * __iris_MD5Digest;
@end

NS_ASSUME_NONNULL_END
