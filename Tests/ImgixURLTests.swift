//
//  ImgixURLTests.swift
//  Iris
//
//  Created by Jonathan Baker on 11/12/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import XCTest
@testable import Iris

final class ImgixURLTests: XCTestCase {

    func testImgixURL() {
        let baseURL = URL(string: "https://www.example.com?foo=bar")
        let passURL = URL(string: "https://www.example.com?fm=jpg&foo=bar")
        XCTAssertEqual(passURL, baseURL?.imgixURL(imageOptions: ImageOptions(format: .JPEG)))
    }

    func testImgixURLWithSigningOptions() {
        let imageOptions = ImageOptions()
        let signingOptions = SigningOptions(host: "example.imgix.net", token: "FOO123bar")

        let sourceURL1 = URL(string: "http://avatars.com/john-smith.png")
        let resultURL1 = URL(string: "https://example.imgix.net/http:%2F%2Favatars.com%2Fjohn-smith.png?s=5837485941857dcad7a2bb1887e9dcc1")

        XCTAssertEqual(resultURL1, sourceURL1?.imgixURL(imageOptions: imageOptions, signingOptions: signingOptions))
    }

    func testImgixURLWithDuplicateQueryItems() {
        let baseURL = URL(string: "https://www.example.com?w=400")
        let passURL = URL(string: "https://www.example.com?fm=jpg&w=500.0")
        XCTAssertEqual(passURL, baseURL?.imgixURL(imageOptions: ImageOptions(format: .JPEG, width: 500)))
    }
}
