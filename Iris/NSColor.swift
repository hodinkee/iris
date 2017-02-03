//
//  NSColor.swift
//  Iris
//
//  Created by Caleb Davenport on 1/10/17.
//  Copyright © 2017 HODINKEE. All rights reserved.
//

#if os(macOS)

public typealias Color = NSColor

extension NSColor {

    @nonobjc
    var hexadecimalColorString: String? {
        guard let color = usingColorSpace(.sRGB) else {
            return nil
        }

        var a: CGFloat = 0
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0

        color.getRed(&r, green: &g, blue: &b, alpha: &a)

        return String(format: "%02X%02X%02X%02X", ((Int)(a * 255)), ((Int)(r * 255)), ((Int)(g * 255)), ((Int)(b * 255)))
    }
}

#endif // os(macOS)
