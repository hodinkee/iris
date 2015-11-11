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
        case JSON = "json"
        case MP4 = "mp4"
        case WebP = "webp"
    }

    public enum FitMode: String {
        case Crop = "crop"
        case Clip = "clip"
        case Clamp = "clamp"
        case FaceArea = "facearea"
        case Fill = "fill"
        case Max = "max"
        case Min = "min"
        case Scale = "scale"
    }

    public enum CropMode: String {
        case Top = "top"
        case Bottom = "bottom"
        case Left = "left"
        case Right = "right"
        case Faces = "faces"
        case Entropy = "entropy"
    }


    // MARK: - Properties

    /**
     The output format to convert the image to.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/format#param-fm)
    */
    public var format: Format?

    /**
     The width of the output image.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/size#param-w)
    */
    public var width: CGFloat?

    /**
     The height of the output image.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/size#param-h)
     */
    public var height: CGFloat?

    /**
     The device pixel ratio to be used.
     
     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/pixeldensity)
    */
    public var scale: CGFloat?

    /**
     Controls how the output image is fit to its target dimensions.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/size#param-fit)
    */
    public var fit: FitMode?

    /**
     Controls how the input image is aligned when the `fit` property
     is set to `FitMode.Crop`

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/size#param-crop)
    */
    public var crop: [CropMode]?

    public var lossless: Bool?

    public var quality: Int? {
        get { return _quality }
        set { _quality = newValue?.clamp(min: 0, max: 100) }
    }

    public var colorQuantization: Int? {
        get { return _colorQuantization }
        set { _colorQuantization = newValue?.clamp(min: 2, max: 256) }
    }

    private var _quality: Int?

    private var _colorQuantization: Int?


    // MARK: - Initializers

    public init(format: Format? = nil, width: CGFloat? = nil, height: CGFloat? = nil, scale: CGFloat? = nil, fit: FitMode? = nil, crop: [CropMode]? = nil) {
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
            items.append(NSURLQueryItem(name: "fm", value: value.rawValue))
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

        if let value = lossless {
            items.append(NSURLQueryItem(name: "lossless", value: String(value)))
        }

        if let value = quality {
            items.append(NSURLQueryItem(name: "q", value: String(value)))
        }

        if let value = colorQuantization {
            items.append(NSURLQueryItem(name: "colorquant", value: String(value)))
        }

        return items
    }
}

public func ==(lhs: ImageOptions, rhs: ImageOptions) -> Bool {
    return lhs.queryItems == rhs.queryItems
}

extension Comparable {
    func clamp(min min: Self, max: Self) -> Self {
        return Swift.max(min, Swift.min(max, self))
    }
}
