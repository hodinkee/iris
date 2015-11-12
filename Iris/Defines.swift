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
