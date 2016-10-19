//
//  SigningOptionsTests.swift
//  Iris
//
//  Created by Jonathan Baker on 11/12/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import XCTest
import Iris

final class SigningOptionsTests: XCTestCase {

    // MARK: - Initializer Tests

    func testSigningOptionsInit() {
        let signingOptions = SigningOptions(host: "example.imgix.net", token: "FOObar123")

        XCTAssertEqual(signingOptions.host, "example.imgix.net")
        XCTAssertEqual(signingOptions.token, "FOObar123")
        XCTAssertEqual(signingOptions.secure, true)
    }

    func testSigningOptionsInitInsecure() {
        let signingOptions = SigningOptions(host: "example.imgix.net", token: "FOObar123", secure: false)

        XCTAssertEqual(signingOptions.host, "example.imgix.net")
        XCTAssertEqual(signingOptions.token, "FOObar123")
        XCTAssertEqual(signingOptions.secure, false)
    }

    // MARK: - Equatable Tests

    func testSigningOptionsEquatable() {
        let signingOptionsOne = SigningOptions(host: "example.imgix.net", token: "FOObar123")
        let signingOptionsTwo = SigningOptions(host: "example.imgix.net", token: "FOObar123", secure: true)
        XCTAssertEqual(signingOptionsOne, signingOptionsTwo)
    }
}
