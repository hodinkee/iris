//
//  NSURL+Iris.swift
//  Iris
//
//  Created by Jonathan Baker on 11/11/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import Foundation

extension NSURL {

    /**
     Applies the given image and signing options to receiver.

     - parameters:
        - imageOptions: An instance of `ImageOptions` to apply to the
     receiver.
        - signingOptions: An optional instance of `SigningOptions` to apply to
     the receiver.

     - returns: An NSURL with the given options applied.
     */
    public func imgixURL(imageOptions imageOptions: ImageOptions, signingOptions: SigningOptions? = nil) -> NSURL? {
        if let signingOptions = signingOptions {
            return signedImgixURL(imageOptions: imageOptions, signingOptions: signingOptions)
        }
        else {
            return plainImgixURL(imageOptions: imageOptions)
        }
    }


    // MARK: - Private

    private func plainImgixURL(imageOptions imageOptions: ImageOptions) -> NSURL? {
        if imageOptions.queryItems.isEmpty {
            return self
        }

        guard let components = NSURLComponents(URL: self, resolvingAgainstBaseURL: true) else {
            return nil
        }

        let existingQueryItems = components.queryItems ?? []
        components.queryItems = existingQueryItems + imageOptions.queryItems

        return components.URL
    }

    private func signedImgixURL(imageOptions imageOptions: ImageOptions, signingOptions: SigningOptions) -> NSURL? {
        func encodedPath() -> String? {
            return absoluteString.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()).map({
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

            return signatureBase.__iris_MD5Digest
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
}
