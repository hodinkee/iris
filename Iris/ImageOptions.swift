//
//  ImageOptions.swift
//  Iris
//
//  Created by Jonathan Baker on 11/11/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import Foundation

public struct ImageOptions {

    // MARK: - Types

    public enum Format: String {
        case jpeg = "jpg"
        case png = "png"
        case json = "json"
        case mp4 = "mp4"
        case webp = "webp"
    }

    public enum FitMode: String {
        case crop = "crop"
        case clip = "clip"
        case clamp = "clamp"
        case faceArea = "facearea"
        case fill = "fill"
        case max = "max"
        case min = "min"
        case scale = "scale"
    }

    public enum CropMode: String {
        case top = "top"
        case bottom = "bottom"
        case left = "left"
        case right = "right"
        case faces = "faces"
        case entropy = "entropy"
    }

    // MARK: - Properties

    var storage = [ImageOptionKey: Any]()

    // MARK: - Adjustment Properties

    /**
     Adjusts the brightness of the image.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-bri)
    */
    public var brightness: Int? {
        get { return storage[.brightness] as? Int }
        set { storage[.brightness] = newValue?.clamped(to: -100...100) }
    }

    /**
     Adjusts the contrast of the image.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-con)
    */
    public var contrast: Int? {
        get { return storage[.contrast] as? Int }
        set { storage[.contrast] = newValue?.clamped(to: -100...100) }
    }

    /**
     Adjusts the exposure of the image.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-exp)
    */
    public var exposure: Int? {
        get { return storage[.exposure] as? Int }
        set { storage[.exposure] = newValue?.clamped(to: -100...100) }
    }

    /**
     Adjusts gamma/midtone brightness.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-gam)
    */
    public var gamma: Int? {
        get { return storage[.gamma] as? Int }
        set { storage[.gamma] = newValue?.clamped(to: -100...100) }
    }

    /**
     Adjusts the highlight tonal mapping of an image while preserving 
     spatial detail.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-high)
    */
    public var highlight: Int? {
        get { return storage[.highlight] as? Int }
        set { storage[.highlight] = newValue?.clamped(to: -100...100) }
    }

    /**
     Changes the overall hue, or tint, of the source pixels.

     Values are clamped to the range `0...359`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-hue)
    */
    public var hue: Int? {
        get { return storage[.hue] as? Int }
        set { storage[.hue] = newValue?.clamped(to: 0...359) }
    }

    /**
     Inverts all the pixel colors and brightness values within the image
     producing a negative of the image.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-invert)
    */
    public var invert: Bool? {
        get { return storage[.invert] as? Bool }
        set { storage[.invert] = newValue }
    }

    /**
     Adjusts the saturation of the image.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-sat)
    */
    public var saturation: Int? {
        get { return storage[.saturation] as? Int }
        set { storage[.saturation] = newValue?.clamped(to: -100...100) }
    }

    /**
     Adjusts the shadow tonal mapping of an image while preserving 
     spatial detail.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-shad)
    */
    public var shadow: Int? {
        get { return storage[.shadow] as? Int }
        set { storage[.shadow] = newValue?.clamped(to: -100...100) }
    }

    /**
     Sharpens the image details using luminance sharpening.

     Values are clamped to the range `0...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-sharp)
    */
    public var sharpen: Int? {
        get { return storage[.sharpen] as? Int }
        set { storage[.sharpen] = newValue?.clamped(to: 0...100) }
    }

    /**
     Adjusts the vibrance of an image while keeping pleasing skin tones.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-vib)
    */
    public var vibrance: Int? {
        get { return storage[.vibrance] as? Int }
        set { storage[.vibrance] = newValue?.clamped(to: -100...100) }
    }


    // MARK: - Size Properties

    /**
     The width of the output image.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/size#param-w)
    */
    public var width: CGFloat? {
        get { return storage[.width] as? CGFloat }
        set { storage[.width] = newValue }
    }

    /**
     The height of the output image.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/size#param-h)
    */
    public var height: CGFloat? {
        get { return storage[.height] as? CGFloat }
        set { storage[.height] = newValue }
    }

    /**
     The device pixel ratio to be used.
     
     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/pixeldensity)
    */
    public var scale: CGFloat? {
        get { return storage[.scale] as? CGFloat }
        set { storage[.scale] = newValue }
    }

    /**
     Controls how the output image is fit to its target dimensions.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/size#param-fit)
    */
    public var fit: FitMode? {
        get { return storage[.fit] as? FitMode }
        set { storage[.fit] = newValue }
    }

    /**
     Controls how the input image is aligned when the `fit` property
     is set to `FitMode.Crop`

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/size#param-crop)
    */
    public var crop: [CropMode]? {
        get { return storage[.crop] as? [CropMode] }
        set { storage[.crop] = newValue }
    }

    /**
     Selects a sub-region (rect) of the source image to use for processing.
     
     Value is set equal to `nil` if `CGRect.isNull`, `CGRect.isEmpty`, or `CGRect.isInfinite`
     returns true.
     
     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/size#param-rect)
    */
    public var cropRect: CGRect? {
        get { return storage[.cropRect] as? CGRect }
        set {
            if let rect = newValue, !rect.isNull, !rect.isEmpty, !rect.isInfinite {
                storage[.cropRect] = rect
            }
            else {
                storage[.cropRect] = nil
            }
        }
    }


    // MARK: - Format Properties

    /**
     The output format to convert the image to.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/format#param-fm)
    */
    public var format: Format? {
        get { return storage[.format] as? Format }
        set { storage[.format] = newValue }
    }

    /**
     The DPI value in the Exif header of the resulting image.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/format#param-dpi)
    */
    public var DPI: Int? {
        get { return storage[.dpi] as? Int }
        set { storage[.dpi] = newValue }
    }

    /**
     Enables or disables lossless compression. Only available when using
     certain formats.
     
     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/format#param-lossless)
    */
    public var lossless: Bool? {
        get { return storage[.lossless] as? Bool }
        set { storage[.lossless] = newValue }
    }

    /**
     Controls the output quality of lossy file formats. 
     
     Values are clamped to the range of `0...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/format#param-q)
    */
    public var quality: Int? {
        get { return storage[.quality] as? Int }
        set { storage[.quality] = newValue?.clamped(to: 0...100) }
    }

    /**
     Limits the amount of colors in a picture using color quantization, which 
     is a process that reduces the amount of distinct colors in an image while 
     maintaining a visually-similar image. 

     Values are clamped to the range of `2...256`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/format#param-colorquant)
    */
    public var colorQuantization: Int? {
        get { return storage[.colorQuantization] as? Int }
        set { storage[.colorQuantization] = newValue?.clamped(to: 2...256) }
    }


    // MARK: - Background Properties

    /// The background color to use when transparency is encountered. This color
    /// is also used when using `FitMode.Fill`.
    ///
    /// - seealso: [Imgix API Reference](https://www.imgix.com/docs/reference/background#param-bg)
    public var backgroundColor: Color? {
        get { return storage[.backgroundColor] as? Color }
        set { storage[.backgroundColor] = newValue }
    }

    /// Sets the color of the text.
    ///
    /// - seealso: [Imgix Reference](https://docs.imgix.com/apis/url/text/txtclr)
    public var textColor: Color? {
        get { return storage[.textColor] as? Color }
        set { storage[.textColor] = newValue }
    }

    /// Sets the font size of the text.
    ///
    /// - seealso: [Imgix Reference](https://docs.imgix.com/apis/url/text/txtsize)
    public var textSize: CGFloat? {
        get { return storage[.textSize] as? CGFloat }
        set { storage[.textSize] = newValue }
    }


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

    /**
     The configured options as `[NSURLQueryItem]`, suitable for use
     with `NSURLComponents`.
    */
    public var queryItems: [URLQueryItem] {
        var items = [URLQueryItem]()

        // Adjustment Properties

        if let value = brightness {
            items.append(URLQueryItem(name: "bri", value: String(value)))
        }

        if let value = contrast {
            items.append(URLQueryItem(name: "con", value: String(value)))
        }

        if let value = exposure {
            items.append(URLQueryItem(name: "exp", value: String(value)))
        }

        if let value = gamma {
            items.append(URLQueryItem(name: "gam", value: String(value)))
        }

        if let value = highlight {
            items.append(URLQueryItem(name: "high", value: String(value)))
        }

        if let value = hue {
            items.append(URLQueryItem(name: "hue", value: String(value)))
        }

        if let value = invert {
            items.append(URLQueryItem(name: "invert", value: String(value)))
        }

        if let value = saturation {
            items.append(URLQueryItem(name: "sat", value: String(value)))
        }

        if let value = shadow {
            items.append(URLQueryItem(name: "shad", value: String(value)))
        }

        if let value = sharpen {
            items.append(URLQueryItem(name: "sharp", value: String(value)))
        }

        if let value = vibrance {
            items.append(URLQueryItem(name: "vib", value: String(value)))
        }

        // Size Properties

        if let value = width {
            items.append(URLQueryItem(name: "w", value: String(describing: value)))
        }

        if let value = height {
            items.append(URLQueryItem(name: "h", value: String(describing: value)))
        }

        if let value = fit {
            items.append(URLQueryItem(name: "fit", value: value.rawValue))
        }

        if let value = scale {
            items.append(URLQueryItem(name: "dpr", value: String(describing: value)))
        }

        if let value = crop {
            items.append(URLQueryItem(name: "crop", value: value.map({ $0.rawValue }).joined(separator: ",")))
        }

        if let value = cropRect {
            let serialized = "\(value.origin.x),\(value.origin.y),\(value.width),\(value.height)"
            items.append(URLQueryItem(name: "rect", value: serialized))
        }

        // Format Properties

        if let value = format {
            items.append(URLQueryItem(name: "fm", value: value.rawValue))
        }

        if let value = DPI {
            items.append(URLQueryItem(name: "dpi", value: String(value)))
        }

        if let value = lossless {
            items.append(URLQueryItem(name: "lossless", value: String(value)))
        }

        if let value = quality {
            items.append(URLQueryItem(name: "q", value: String(value)))
        }

        if let value = colorQuantization {
            items.append(URLQueryItem(name: "colorquant", value: String(value)))
        }

        // Background Properties

        if let value = backgroundColor, let hex = value.hexadecimalColorString {
            items.append(URLQueryItem(name: "bg", value: hex))
        }

        // Text properties

        if let value = textColor, let hexadecimalString = value.hexadecimalColorString {
            items.append(URLQueryItem(name: "txtclr", value: hexadecimalString))
        }

        if let value = textSize {
            items.append(URLQueryItem(name: "txtsize", value: String(describing: value)))
        }

        return items
    }
}

extension ImageOptions: Equatable {}

public func ==(lhs: ImageOptions, rhs: ImageOptions) -> Bool {
    return lhs.queryItems == rhs.queryItems
}
