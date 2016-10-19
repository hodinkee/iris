//
//  Comparable+Clamp.swift
//  Iris
//
//  Created by Caleb Davenport on 10/19/16.
//  Copyright © 2016 HODINKEE. All rights reserved.
//

extension Comparable {

    /// Clamp the receiver to the given interval.
    func clamp(interval: ClosedInterval<Self>) -> Self {
        return max(interval.start, min(interval.end, self))
    }
}
