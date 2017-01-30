//
//  ImageOptionKey.swift
//  Iris
//
//  Created by Jonathan Baker on 1/30/17.
//  Copyright © 2017 HODINKEE. All rights reserved.
//

enum ImageOptionKey: String {

    // MARK: - Adjustment Options

    case brightness = "bri"
    case contrast = "con"
    case exposure = "exp"
    case gamma = "gam"
    case highlight = "high"
    case hue = "hue"
    case invert = "invert"
    case saturation = "sat"
    case shadow = "shad"
    case sharpen = "sharp"
    case vibrance = "vib"

    // MARK: - Size Options

    case width = "w"
    case height = "h"
    case fit = "fit"
    case scale = "dpr"
    case crop = "crop"
    case cropRect = "rect"

    // MARK: - Format Options

    case format = "fm"
    case dpi = "dpi"
    case lossless = "lossless"
    case quality = "q"
    case colorQuantization = "colorquant"

    // MARK: - Background Options

    case backgroundColor = "bg"

    // MARK: - Text Options

    case textSize = "txtsize"
    case textColor = "txtclr"
}
