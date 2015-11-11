//
//  ImageOptions.swift
//  Iris
//
//  Created by Jonathan Baker on 11/11/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import Foundation

public struct ImageOptions: Equatable {

    // MARK: - Types

    public enum Format: String {
        case JPEG = "jpg"
        case PNG = "png"
    }

    public enum Fit: String {
        case Crop = "crop"
        case Clip = "clip"
    }

    public enum Crop: String {
        case Faces = "faces"
        case Entropy = "entropy"
    }


    // MARK: - Properties

    public var format: Format?

    public var width: CGFloat?

    public var height: CGFloat?

    public var scale: CGFloat?

    public var fit: Fit?

    public var crop: [Crop]?


    // MARK: - Initializers

    public init(format: Format? = nil, width: CGFloat? = nil, height: CGFloat? = nil, scale: CGFloat? = nil, fit: Fit? = nil, crop: [Crop]? = nil) {
        self.format = format
        self.width = width
        self.height = height
        self.scale = scale
        self.fit = fit
        self.crop = crop
    }


    // MARK: - Public

    public var queryItems: [NSURLQueryItem] {
        var items = [NSURLQueryItem]()

        if let value = format {
            items.append( NSURLQueryItem(name: "fm", value: value.rawValue))
        }

        if let value = width {
            items.append(NSURLQueryItem(name: "w", value: String(value)))
        }

        if let value = height {
            items.append(NSURLQueryItem(name: "h", value: String(value)))
        }

        if let value = fit {
            items.append(NSURLQueryItem(name: "fit", value: value.rawValue))
        }

        if let value = scale {
            items.append(NSURLQueryItem(name: "dpr", value: String(value)))
        }

        if let value = crop {
            items.append(NSURLQueryItem(name: "crop", value: value.map({ $0.rawValue }).joinWithSeparator(",")))
        }
        
        return items
    }
}

public func ==(lhs: ImageOptions, rhs: ImageOptions) -> Bool {
    return lhs.queryItems == rhs.queryItems
}
