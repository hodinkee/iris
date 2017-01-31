//
//  Deprecated.swift
//  Iris
//
//  Created by Caleb Davenport on 1/10/17.
//  Copyright © 2017 HODINKEE. All rights reserved.
//

extension ImageOptions {
    @available(*, deprecated, renamed: "dpi")
    public var DPI: Int? {
        get { return dpi }
        set { dpi = newValue }
    }
}

extension ImageOptions.CropMode {
    @available(*, deprecated, renamed: "top")
    public static var Top: ImageOptions.CropMode { return .top }

    @available(*, deprecated, renamed: "bottom")
    public static var Bottom: ImageOptions.CropMode { return .bottom }

    @available(*, deprecated, renamed: "left")
    public static var Left: ImageOptions.CropMode { return .left }

    @available(*, deprecated, renamed: "right")
    public static var Right: ImageOptions.CropMode { return .right }

    @available(*, deprecated, renamed: "faces")
    public static var Faces: ImageOptions.CropMode { return .faces }

    @available(*, deprecated, renamed: "entropy")
    public static var Entropy: ImageOptions.CropMode { return .entropy }
}

extension ImageOptions.FitMode {
    @available(*, deprecated, renamed: "crop")
    public static var Crop: ImageOptions.FitMode { return .crop }

    @available(*, deprecated, renamed: "clip")
    public static var Clip: ImageOptions.FitMode { return .clip }

    @available(*, deprecated, renamed: "clamp")
    public static var Clamp: ImageOptions.FitMode { return .clamp }

    @available(*, deprecated, renamed: "faceArea")
    public static var FaceArea: ImageOptions.FitMode { return .faceArea }

    @available(*, deprecated, renamed: "fill")
    public static var Fill: ImageOptions.FitMode { return .fill }

    @available(*, deprecated, renamed: "max")
    public static var Max: ImageOptions.FitMode { return .max }

    @available(*, deprecated, renamed: "min")
    public static var Min: ImageOptions.FitMode { return .min }

    @available(*, deprecated, renamed: "scale")
    public static var Scale: ImageOptions.FitMode { return .scale }
}

extension ImageOptions.Format {
    @available(*, deprecated, renamed: "jpeg")
    public static var JPEG: ImageOptions.Format { return .jpeg }

    @available(*, deprecated, renamed: "png")
    public static var PNG: ImageOptions.Format { return .png }

    @available(*, deprecated, renamed: "json")
    public static var JSON: ImageOptions.Format { return .json }

    @available(*, deprecated, renamed: "mp4")
    public static var MP4: ImageOptions.Format { return .mp4 }

    @available(*, deprecated, renamed: "webp")
    public static var WebP: ImageOptions.Format { return .webp }
}

@available(*, unavailable, message: "ImageOptions now only accepts UIColor on iOS and tvOS and NSColor on macOS.")
public protocol HexadecimalColorStringConvertable {}
