//
//  SigningOptions.swift
//  Iris
//
//  Created by Jonathan Baker on 11/11/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import Foundation

public struct SigningOptions: Equatable {

    // MARK: - Properties

    /**
     The host pertaining to an Imgix source.
    
     Example: `hodinkee.imgix.net`
    */
    public var host: String

    /**
     The alphanumeric "Secure URL Token" pertaining to an Imgix source.

     Example: `hodinkee.imgix.net`
    */
    public var token: String

    /**
     Controls whether or not to use HTTPS when requesting the image.
    */
    public var secure: Bool


    // MARK: - Initializers

    public init(host: String, token: String, secure: Bool = true) {
        self.host = host
        self.token = token
        self.secure = secure
    }
}

public func ==(lhs: SigningOptions, rhs: SigningOptions) -> Bool {
    return (lhs.host == rhs.host) && (lhs.token == rhs.token) && (lhs.secure == rhs.secure)
}
