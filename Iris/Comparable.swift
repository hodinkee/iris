//
//  Comparable.swift
//  Iris
//
//  Created by Caleb Davenport on 10/19/16.
//  Copyright © 2016 HODINKEE. All rights reserved.
//

extension Comparable {

    /// Clamp the receiver to the given interval.
    func clamped(to range: ClosedRange<Self>) -> Self {
        return max(range.lowerBound, min(range.upperBound, self))
    }
}
