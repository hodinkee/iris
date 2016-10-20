//
//  Comparable+Clamp.swift
//  Iris
//
//  Created by Caleb Davenport on 10/19/16.
//  Copyright © 2016 HODINKEE. All rights reserved.
//

extension Comparable {

    /// Clamp the receiver to the given interval.
    func clamp(_ interval: ClosedRange<Self>) -> Self {
        return max(interval.lowerBound, min(interval.upperBound, self))
    }
}
