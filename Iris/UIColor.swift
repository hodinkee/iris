//
//  UIColor.swift
//  Iris
//
//  Created by Caleb Davenport on 1/10/17.
//  Copyright © 2017 HODINKEE. All rights reserved.
//

#if os(iOS) || os(tvOS)

public typealias Color = UIColor

extension UIColor {

    @nonobjc
    var hexadecimalColorString: String? {
        var a: CGFloat = 0
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0

        guard getRed(&r, green: &g, blue: &b, alpha: &a) else {
            return nil
        }

        return String(format: "%02X%02X%02X%02X", ((Int)(a * 255)), ((Int)(r * 255)), ((Int)(g * 255)), ((Int)(b * 255)))
    }
}

#endif // os(iOS) || os(tvOS)
