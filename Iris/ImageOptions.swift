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

    // MARK: - Adjustment Properties

    /**
     Adjusts the brightness of the image.
    
     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-bri)
    */
    public var brightness: Int? {
        get { return _brightness }
        set { _brightness = newValue?.clamp(min: -100, max: 100) }
    }
    private var _brightness: Int?

    /**
     Adjusts the contrast of the image.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-con)
    */
    public var contrast: Int? {
        get { return _contrast }
        set { _contrast = newValue?.clamp(min: -100, max: 100) }
    }
    private var _contrast: Int?

    /**
     Adjusts the exposure of the image.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-exp)
    */
    public var exposure: Int? {
        get { return _exposure }
        set { _exposure = newValue?.clamp(min: -100, max: 100) }
    }
    private var _exposure: Int?

    /**
     Adjusts gamma/midtone brightness.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-gam)
    */
    public var gamma: Int? {
        get { return _gamma }
        set { _gamma = newValue?.clamp(min: -100, max: 100) }
    }
    private var _gamma: Int?

    /**
     Adjusts the highlight tonal mapping of an image while preserving 
     spatial detail.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-high)
    */
    public var highlight: Int? {
        get { return _highlight }
        set { _highlight = newValue?.clamp(min: -100, max: 100) }
    }
    private var _highlight: Int?

    /**
     Changes the overall hue, or tint, of the source pixels.

     Values are clamped to the range `0...359`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-hue)
    */
    public var hue: Int? {
        get { return _hue }
        set { _hue = newValue?.clamp(min: 0, max: 359) }
    }
    private var _hue: Int?

    /**
     Inverts all the pixel colors and brightness values within the image
     producing a negative of the image.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-invert)
    */
    public var invert: Bool?

    /**
     Adjusts the saturation of the image.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-sat)
    */
    public var saturation: Int? {
        get { return _saturation }
        set { _saturation = newValue?.clamp(min: -100, max: 100) }
    }
    private var _saturation: Int?

    /**
     Adjusts the shadow tonal mapping of an image while preserving 
     spatial detail.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-shad)
    */
    public var shadow: Int? {
        get { return _shadow }
        set { _shadow = newValue?.clamp(min: -100, max: 100) }
    }
    private var _shadow: Int?

    /**
     Sharpens the image details using luminance sharpening.

     Values are clamped to the range `0...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-sharp)
    */
    public var sharpen: Int? {
        get { return _sharpen }
        set { _sharpen = newValue?.clamp(min: 0, max: 100) }
    }
    private var _sharpen: Int?

    /**
     Adjusts the vibrance of an image while keeping pleasing skin tones.

     Values are clamped to the range `-100...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/adjustment#param-vib)
    */
    public var vibrance: Int? {
        get { return _vibrance }
        set { _vibrance = newValue?.clamp(min: -100, max: 100) }
    }
    private var _vibrance: Int?


    // MARK: - Size Properties

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

    /**
     Selects a sub-region (rect) of the source image to use for processing.
     
     Value is set equal to `nil` if `CGRect.isNull`, `CGRect.isEmpty`, or `CGRect.isInfinite`
     returns true.
     
     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/size#param-rect)
    */
    public var cropRect: CGRect? {
        get { return _cropRect }
        set {
            if let rect = newValue where !rect.isNull && !rect.isEmpty && !rect.isInfinite {
                _cropRect = rect
            }
            else {
                _cropRect = nil
            }
        }
    }
    private var _cropRect: CGRect?


    // MARK: - Format Properties

    /**
     The output format to convert the image to.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/format#param-fm)
    */
    public var format: Format?

    /**
     The DPI value in the Exif header of the resulting image.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/format#param-dpi)
    */
    public var DPI: Int?

    /**
     Enables or disables lossless compression. Only available when using
     certain formats.
     
     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/format#param-lossless)
    */
    public var lossless: Bool?

    /**
     Controls the output quality of lossy file formats. 
     
     Values are clamped to the range of `0...100`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/format#param-q)
    */
    public var quality: Int? {
        get { return _quality }
        set { _quality = newValue?.clamp(min: 0, max: 100) }
    }
    private var _quality: Int?

    /**
     Limits the amount of colors in a picture using color quantization, which 
     is a process that reduces the amount of distinct colors in an image while 
     maintaining a visually-similar image. 

     Values are clamped to the range of `2...256`.

     - seealso:
     [Imgix API Reference](https://www.imgix.com/docs/reference/format#param-colorquant)
    */
    public var colorQuantization: Int? {
        get { return _colorQuantization }
        set { _colorQuantization = newValue?.clamp(min: 2, max: 256) }
    }
    private var _colorQuantization: Int?


    // MARK: - Background Properties

    /**
    The background color to use when transparency is encountered. This color is
    also used when using `FitMode.Fill`.

    - seealso:
    [Imgix API Reference](https://www.imgix.com/docs/reference/background#param-bg)
    */
    public var backgroundColor: HexadecimalColorStringConvertable?


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
    public var queryItems: [NSURLQueryItem] {
        var items = [NSURLQueryItem]()

        // Adjustment Properties

        if let value = brightness {
            items.append(NSURLQueryItem(name: "bri", value: String(value)))
        }

        if let value = contrast {
            items.append(NSURLQueryItem(name: "con", value: String(value)))
        }

        if let value = exposure {
            items.append(NSURLQueryItem(name: "exp", value: String(value)))
        }

        if let value = gamma {
            items.append(NSURLQueryItem(name: "gam", value: String(value)))
        }

        if let value = highlight {
            items.append(NSURLQueryItem(name: "high", value: String(value)))
        }

        if let value = hue {
            items.append(NSURLQueryItem(name: "hue", value: String(value)))
        }

        if let value = invert {
            items.append(NSURLQueryItem(name: "invert", value: String(value)))
        }

        if let value = saturation {
            items.append(NSURLQueryItem(name: "sat", value: String(value)))
        }

        if let value = shadow {
            items.append(NSURLQueryItem(name: "shad", value: String(value)))
        }

        if let value = sharpen {
            items.append(NSURLQueryItem(name: "sharp", value: String(value)))
        }

        if let value = vibrance {
            items.append(NSURLQueryItem(name: "vib", value: String(value)))
        }

        // Size Properties

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

        if let value = cropRect {
            let serialized = "\(value.origin.x),\(value.origin.y),\(value.width),\(value.height)"
            items.append(NSURLQueryItem(name: "rect", value: serialized))
        }

        // Format Properties

        if let value = format {
            items.append(NSURLQueryItem(name: "fm", value: value.rawValue))
        }

        if let value = DPI {
            items.append(NSURLQueryItem(name: "dpi", value: String(value)))
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

        // Background Properties

        if let value = backgroundColor, let hex = value.hexadecimalColorString {
            items.append(NSURLQueryItem(name: "bg", value: hex))
        }

        return items
    }
}

public func ==(lhs: ImageOptions, rhs: ImageOptions) -> Bool {
    return lhs.queryItems == rhs.queryItems
}
