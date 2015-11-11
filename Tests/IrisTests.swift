//
//  IrisTests.swift
//  IrisTests
//
//  Created by Jonathan Baker on 11/11/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import XCTest
@testable import Iris

final class IrisTests: XCTestCase {

    // MARK: - Tests

    func testImageOptionsQueryItems() {
        XCTAssert(ImageOptions().queryItems.isEmpty, "Default ImageOptions should return empty query items.")

        var imageOptions = ImageOptions(format: .JPEG, width: 320, height: 200, scale: 2.0, fit: .Crop, crop: [.Faces])
        imageOptions.lossless = true

        let queryItems = imageOptions.queryItems

        XCTAssert(queryItems.contains(NSURLQueryItem(name: "fm", value: "jpg")))
        XCTAssert(queryItems.contains(NSURLQueryItem(name: "w", value: "320.0")))
        XCTAssert(queryItems.contains(NSURLQueryItem(name: "h", value: "200.0")))
        XCTAssert(queryItems.contains(NSURLQueryItem(name: "dpr", value: "2.0")))
        XCTAssert(queryItems.contains(NSURLQueryItem(name: "fit", value: "crop")))
        XCTAssert(queryItems.contains(NSURLQueryItem(name: "crop", value: "faces")))
        XCTAssert(queryItems.contains(NSURLQueryItem(name: "lossless", value: "true")))
    }

    func testImgixURL() {
        let baseURL = NSURL(string: "https://www.example.com?foo=bar")
        let passURL = NSURL(string: "https://www.example.com?foo=bar&fm=jpg")
        XCTAssertEqual(passURL, baseURL?.imgixURL(imageOptions: ImageOptions(format: .JPEG)))
    }

    func testImgixURLWithSigningOptions() {
        let imageOptions = ImageOptions()
        let signingOptions = SigningOptions(host: "example.imgix.net", token: "FOO123bar")

        let sourceURL1 = NSURL(string: "http://avatars.com/john-smith.png")
        let resultURL1 = NSURL(string: "https://example.imgix.net/http%3A%2F%2Favatars.com%2Fjohn-smith.png?s=493a52f008c91416351f8b33d4883135")

        XCTAssertEqual(resultURL1, sourceURL1?.imgixURL(imageOptions: imageOptions, signingOptions: signingOptions))
    }
}
