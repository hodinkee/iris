//
//  NSURL+Iris.swift
//  Iris
//
//  Created by Jonathan Baker on 11/11/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

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

        let combinedQueryItems = imageOptions.queryItems + (components?.queryItems ?? [])

        components?.queryItems = combinedQueryItems
            .reduce([URLQueryItem](), { result, element in
                if result.contains(where: { $0.name == element.name }) {
                    return result
                }
                return result + CollectionOfOne(element)
            })
            .sorted(by: { $0.name < $1.name })

        return components?.url
    }

    /// Applies the given image options to the receiver.
    ///
    /// - parameter imageOptions: An instance of `ImageOptions`.
    /// - parameter signingOptions: An instance of `SigningOptions`.
    ///
    /// - returns: A valid imgix URL or `nil`.
    public func imgixURL(imageOptions: ImageOptions, signingOptions: SigningOptions) -> URL? {
        func makeEncodedPath() -> String? {
            return absoluteString
                .addingPercentEncoding(withAllowedCharacters: .imgixEncodedPath)
                .map({ "/" + $0 })
        }

        guard let encodedPath = makeEncodedPath() else {
            return nil
        }

        func makeSignature() -> String? {
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

        guard let signature = makeSignature() else {
            return nil
        }

        var components = URLComponents()
        components.scheme = signingOptions.secure ? "https" : "http"
        components.host = signingOptions.host
        components.percentEncodedPath = encodedPath
        components.queryItems = imageOptions.queryItems + CollectionOfOne(URLQueryItem(name: "s", value: signature))
        return components.url
    }
}

extension CharacterSet {
    fileprivate static var imgixEncodedPath: CharacterSet {
        var set = CharacterSet.alphanumerics
        set.insert(charactersIn: "-_.!~*'()")
        return set
    }
}
