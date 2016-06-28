//
//  NSURL+Iris.swift
//  Iris
//
//  Created by Jonathan Baker on 11/11/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import Foundation

extension NSURL {

    /// Applies the given image options to the receiver.
    ///
    /// - parameter imageOptions: An instance of `ImageOptions`.
    ///
    /// - returns: A valid imgix URL or `nil`.
    public func imgixURL(imageOptions imageOptions: ImageOptions) -> NSURL? {
        if imageOptions.queryItems.isEmpty {
            return self
        }

        guard let components = NSURLComponents(URL: self, resolvingAgainstBaseURL: true) else {
            return nil
        }

        let combinedQueryItems = imageOptions.queryItems + (components.queryItems ?? [])

        components.queryItems = combinedQueryItems
            .reduce([NSURLQueryItem](), combine: { array, element in
                if array.contains({ $0.name == element.name }) { return array }
                return array + CollectionOfOne(element)
            })
            .sort({ $0.name < $1.name })

        return components.URL
    }

    /// Applies the given image options to the receiver.
    ///
    /// - parameter imageOptions: An instance of `ImageOptions`.
    /// - parameter signingOptions: An instance of `SigningOptions`.
    ///
    /// - returns: A valid imgix URL or `nil`.
    public func imgixURL(imageOptions imageOptions: ImageOptions, signingOptions: SigningOptions) -> NSURL? {
        func encodedPath() -> String? {
            return iris_absoluteString?.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()).map({
                return "/" + $0
            })
        }

        func signature() -> String? {
            guard let encodedPath = encodedPath() else {
                return nil
            }

            let queryItems = imageOptions.queryItems
            var signatureBase = signingOptions.token + encodedPath

            if !queryItems.isEmpty {
                let components = NSURLComponents()
                components.queryItems = queryItems
                if let query = components.query {
                    signatureBase += "?\(query)"
                }
            }

            return signatureBase.iris_MD5
        }

        let components = NSURLComponents()
        components.scheme = signingOptions.secure ? "https" : "http"
        components.host = signingOptions.host
        components.percentEncodedPath = encodedPath()

        guard let sig = signature() else {
            return nil
        }

        components.queryItems = imageOptions.queryItems + CollectionOfOne(NSURLQueryItem(name: "s", value: sig))
        
        return components.URL
    }

    /// This allows Iris to compile on both iOS 9 and iOS 10.
    private var iris_absoluteString: String? {
        return absoluteString
    }
}
