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
     
     If `signingOptions` are not supplied, it is assumed that the receiver is
     already a valid Imgix URL that does not require signing.

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

        /*
            Original URL: https://assets.imgix.net/docs/road-sm.jpg?fit=min&h=200&w=500
        
            If the `imageOptions.queryItems` == ImageOptions(width: 640, height: 480, fit: .Clip) then the
            new URL would be: https://assets.imgix.net/docs/road-sm.jpg?fit=min&h=200&w=500&fit=clip&w=640&h=480
        
            The lines below will replace the `existingQueryItems` with the `imageOptions.queryItems`.
            Note: Don't use the `==` from `NSURLQueryItem` because that will compare if the `name` and `value` properties
            are equal, not just the `name`.
        */
        let newQueryItems = imageOptions.queryItems
        let existingQueryItems = components.queryItems ?? []
        let queryItems = newQueryItems + existingQueryItems.filter {
            for q in newQueryItems {
                if q.name == $0.name {
                    return false
                }
            }
            return true
        }
        components.queryItems = queryItems

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
