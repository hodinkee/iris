//
//  Defines.swift
//  Iris
//
//  Created by Jonathan Baker on 11/12/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import Foundation

extension Comparable {
    func clamp(min min: Self, max: Self) -> Self {
        return Swift.max(min, Swift.min(max, self))
    }
}

extension UIColor {
    var hexString: String? {
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
