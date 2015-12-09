//
//  Defines.swift
//  Iris
//
//  Created by Jonathan Baker on 11/12/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import Foundation

public protocol HexadecimalColorStringConvertable {
    /**
    Returns a color in hexadecimal string notation. (7F336699)

    Valid values are 3-value (rgb), 4-value (argb), 6-value (rgb), 
    or 8-value (argb) hexadecimal colors.
    */
    var hexadecimalColorString: String? { get }
}

#if os(iOS) || os(tvOS)
extension UIColor: HexadecimalColorStringConvertable {
    public var hexadecimalColorString: String? {
        var a: CGFloat = 0
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0

        guard getRed(&r, green: &g, blue: &b, alpha: &a) else {
            return nil
        }

        return String(format: "%02X%02X%02X%02X", ((Int)(a * 255.0)), ((Int)(r * 255.0)), ((Int)(g * 255.0)), ((Int)(b * 255.0)))
    }
}
#endif

extension Comparable {
    func clamp(min min: Self, max: Self) -> Self {
        return Swift.max(min, Swift.min(max, self))
    }
}
