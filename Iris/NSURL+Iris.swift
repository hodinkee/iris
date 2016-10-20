//
//  NSURL+Iris.swift
//  Iris
//
//  Created by Jonathan Baker on 11/11/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import Foundation

extension URL {

    /// Applies the given image options to the receiver.
    ///
    /// - parameter imageOptions: An instance of `ImageOptions`.
    ///
    /// - returns: A valid imgix URL or `nil`.
    public func imgixURL(imageOptions: ImageOptions) -> URL? {
        if imageOptions.queryItems.isEmpty {
            return self
        }

        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)

        components?.queryItems = imageOptions.queryItems
            .sorted(by: { $0.name < $1.name })

//        let combinedQueryItems = imageOptions.queryItems + (components.queryItems ?? [])
//        components.queryItems = combinedQueryItems
//            .reduce([URLQueryItem](), { array, element in
//                if array.contains(where: { $0.name == element.name }) { return array }
//                return array + CollectionOfOne(element)
//            })
//            .sorted(by: { $0.name < $1.name })

        return components?.url
    }

    /// Applies the given image options to the receiver.
    ///
    /// - parameter imageOptions: An instance of `ImageOptions`.
    /// - parameter signingOptions: An instance of `SigningOptions`.
    ///
    /// - returns: A valid imgix URL or `nil`.
    public func imgixURL(imageOptions: ImageOptions, signingOptions: SigningOptions) -> URL? {
        func encodedPath() -> String? {
//            return absoluteString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed()).map({
//                return "/" + $0
//            })
            return ""
        }

        func signature() -> String? {
            guard let encodedPath = encodedPath() else {
                return nil
            }

            let queryItems = imageOptions.queryItems
            var signatureBase = signingOptions.token + encodedPath

            if !queryItems.isEmpty {
                var components = URLComponents()
                components.queryItems = queryItems as [URLQueryItem]?
                if let query = components.query {
                    signatureBase += "?\(query)"
                }
            }

            return signatureBase.iris_MD5
        }

        var components = URLComponents()
        components.scheme = signingOptions.secure ? "https" : "http"
        components.host = signingOptions.host
        components.percentEncodedPath = encodedPath()!

        guard let sig = signature() else {
            return nil
        }

        components.queryItems = imageOptions.queryItems + CollectionOfOne(URLQueryItem(name: "s", value: sig))
        
        return components.url
    }
}
