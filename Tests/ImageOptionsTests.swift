//
//  ImageOptionsTests.swift
//  Iris
//
//  Created by Jonathan Baker on 11/12/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import XCTest
import Iris

final class ImageOptionsTests: XCTestCase {

    // MARK: - Test Case Properties

    private var imageOptions = ImageOptions()

    private var queryItems: [URLQueryItem] {
        return imageOptions.queryItems
    }

    // MARK: - XCTestCase

    override func setUp() {
        imageOptions = ImageOptions()
    }

    // MARK: - Initializer Tests

    func testImageOptionsInit() {
        let queryItems = imageOptions.queryItems
        XCTAssert(queryItems.isEmpty, "Default ImageOptions should return empty query items.")
    }

    // MARK: - Equatable Tests

    func testImageOptionsEquatable() {
        let imageOptionsOne = ImageOptions(format: .jpeg, width: 320, height: 250)
        let imageOptionsTwo = ImageOptions(format: .jpeg, width: 320, height: 250)
        XCTAssertEqual(imageOptionsOne, imageOptionsTwo)
    }

    // MARK: - Adjustment Properties

    func testImageOptionsBrightness() {
        imageOptions.brightness = -500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "bri", value: "-100")])

        imageOptions.brightness = 500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "bri", value: "100")])

        imageOptions.brightness = 75
        XCTAssertEqual(queryItems, [URLQueryItem(name: "bri", value: "75")])
    }

    func testImageOptionsContrast() {
        imageOptions.contrast = -500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "con", value: "-100")])

        imageOptions.contrast = 500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "con", value: "100")])

        imageOptions.contrast = 75
        XCTAssertEqual(queryItems, [URLQueryItem(name: "con", value: "75")])
    }

    func testImageOptionsExposure() {
        imageOptions.exposure = -500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "exp", value: "-100")])

        imageOptions.exposure = 500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "exp", value: "100")])

        imageOptions.exposure = 75
        XCTAssertEqual(queryItems, [URLQueryItem(name: "exp", value: "75")])
    }

    func testImageOptionsGamma() {
        imageOptions.gamma = -500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "gam", value: "-100")])

        imageOptions.gamma = 500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "gam", value: "100")])

        imageOptions.gamma = 75
        XCTAssertEqual(queryItems, [URLQueryItem(name: "gam", value: "75")])
    }

    func testImageOptionsHighlight() {
        imageOptions.highlight = -500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "high", value: "-100")])

        imageOptions.highlight = 500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "high", value: "100")])

        imageOptions.highlight = 75
        XCTAssertEqual(queryItems, [URLQueryItem(name: "high", value: "75")])
    }

    func testImageOptionsHue() {
        imageOptions.hue = -500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "hue", value: "0")])

        imageOptions.hue = 500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "hue", value: "359")])

        imageOptions.hue = 75
        XCTAssertEqual(queryItems, [URLQueryItem(name: "hue", value: "75")])
    }

    func testImageOptionsInvert() {
        imageOptions.invert = true
        XCTAssertEqual(queryItems, [URLQueryItem(name: "invert", value: "true")])
    }

    func testImageOptionsSaturation() {
        imageOptions.saturation = -500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "sat", value: "-100")])

        imageOptions.saturation = 500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "sat", value: "100")])

        imageOptions.saturation = 75
        XCTAssertEqual(queryItems, [URLQueryItem(name: "sat", value: "75")])
    }

    func testImageOptionsShadow() {
        imageOptions.shadow = -500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "shad", value: "-100")])

        imageOptions.shadow = 500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "shad", value: "100")])

        imageOptions.shadow = 75
        XCTAssertEqual(queryItems, [URLQueryItem(name: "shad", value: "75")])
    }

    func testImageOptionsSharpen() {
        imageOptions.sharpen = -500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "sharp", value: "0")])

        imageOptions.sharpen = 500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "sharp", value: "100")])

        imageOptions.sharpen = 75
        XCTAssertEqual(queryItems, [URLQueryItem(name: "sharp", value: "75")])
    }

    func testImageOptionsVibrance() {
        imageOptions.vibrance = -500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "vib", value: "-100")])

        imageOptions.vibrance = 500
        XCTAssertEqual(queryItems, [URLQueryItem(name: "vib", value: "100")])

        imageOptions.vibrance = 75
        XCTAssertEqual(queryItems, [URLQueryItem(name: "vib", value: "75")])
    }

    // MARK: - Size Properties

    func testImageOptionsWidth() {
        imageOptions.width = 320
        XCTAssertEqual(queryItems, [URLQueryItem(name: "w", value: "320.0")])
    }

    func testImageOptionsHeight() {
        imageOptions.height = 250
        XCTAssertEqual(queryItems, [URLQueryItem(name: "h", value: "250.0")])
    }

    func testImageOptionsFit() {
        imageOptions.fit = .crop
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fit", value: "crop")])

        imageOptions.fit = .clip
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fit", value: "clip")])

        imageOptions.fit = .clamp
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fit", value: "clamp")])

        imageOptions.fit = .faceArea
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fit", value: "facearea")])

        imageOptions.fit = .fill
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fit", value: "fill")])

        imageOptions.fit = .max
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fit", value: "max")])

        imageOptions.fit = .min
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fit", value: "min")])

        imageOptions.fit = .scale
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fit", value: "scale")])
    }

    func testImageOptionsScale() {
        imageOptions.scale = 2.0
        XCTAssertEqual(queryItems, [URLQueryItem(name: "dpr", value: "2.0")])
    }

    func testImageOptionsCrop() {
        imageOptions.crop = [.top]
        XCTAssertEqual(queryItems, [URLQueryItem(name: "crop", value: "top")])

        imageOptions.crop = [.bottom]
        XCTAssertEqual(queryItems, [URLQueryItem(name: "crop", value: "bottom")])

        imageOptions.crop = [.left]
        XCTAssertEqual(queryItems, [URLQueryItem(name: "crop", value: "left")])

        imageOptions.crop = [.right]
        XCTAssertEqual(queryItems, [URLQueryItem(name: "crop", value: "right")])

        imageOptions.crop = [.faces]
        XCTAssertEqual(queryItems, [URLQueryItem(name: "crop", value: "faces")])

        imageOptions.crop = [.entropy]
        XCTAssertEqual(queryItems, [URLQueryItem(name: "crop", value: "entropy")])

        imageOptions.crop = [.top, .left]
        XCTAssertEqual(queryItems, [URLQueryItem(name: "crop", value: "top,left")])
    }

    func testImageOptionsCropRect() {
        imageOptions.cropRect = CGRect.zero
        XCTAssertEqual(queryItems, [])

        imageOptions.cropRect = CGRect(x: 10, y: 20, width: 30, height: 40)
        XCTAssertEqual(queryItems, [URLQueryItem(name: "rect", value: "10.0,20.0,30.0,40.0")])
    }

    // MARK: - Format Properties

    func testImageOptionsFormat() {
        imageOptions.format = .jpeg
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fm", value: "jpg")])

        imageOptions.format = .png
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fm", value: "png")])

        imageOptions.format = .json
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fm", value: "json")])

        imageOptions.format = .mp4
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fm", value: "mp4")])

        imageOptions.format = .webp
        XCTAssertEqual(queryItems, [URLQueryItem(name: "fm", value: "webp")])
    }

    func testImageOptionsDPI() {
        imageOptions.dpi = 320
        XCTAssertEqual(queryItems, [URLQueryItem(name: "dpi", value: "320")])
    }

    func testImageOptionsLossless() {
        imageOptions.lossless = true
        XCTAssertEqual(queryItems, [URLQueryItem(name: "lossless", value: "true")])
    }

    func testImageOptionsQuality() {
        imageOptions.quality = -50
        XCTAssertEqual(queryItems, [URLQueryItem(name: "q", value: "0")])

        imageOptions.quality = 200
        XCTAssertEqual(queryItems, [URLQueryItem(name: "q", value: "100")])

        imageOptions.quality = 75
        XCTAssertEqual(queryItems, [URLQueryItem(name: "q", value: "75")])
    }

    func testImageOptionsColorQuantization() {
        imageOptions.colorQuantization = 0
        XCTAssertEqual(queryItems, [URLQueryItem(name: "colorquant", value: "2")])

        imageOptions.colorQuantization = 512
        XCTAssertEqual(queryItems, [URLQueryItem(name: "colorquant", value: "256")])

        imageOptions.colorQuantization = 75
        XCTAssertEqual(queryItems, [URLQueryItem(name: "colorquant", value: "75")])
    }

    // MARK: - Background Properties

    #if os(iOS) || os(tvOS)
    func testImageOptionsBackgroundColor() {
        imageOptions.backgroundColor = UIColor(red: 0.2, green: 0.4, blue: 0.6, alpha: 0.5)
        XCTAssertEqual(queryItems, [URLQueryItem(name: "bg", value: "7F336699")])
    }
    #else
    func testImageOptionsBackgroundColor() {
        imageOptions.backgroundColor = NSColor(red: 0.2, green: 0.4, blue: 0.6, alpha: 0.5)
        XCTAssertEqual(queryItems, [URLQueryItem(name: "bg", value: "7F336699")])
    }
    #endif

    func testImageOptionsTextSize() {
        imageOptions.textSize = 16.0
        XCTAssertEqual(queryItems, [URLQueryItem(name: "txtsize", value: "16.0")])
    }

    // MARK: - Text Options

    #if os(iOS) || os(tvOS)
    func testImageOptionsTextColor() {
        imageOptions.textColor = UIColor(red: 0.2, green: 0.4, blue: 0.6, alpha: 0.5)
        XCTAssertEqual(queryItems, [URLQueryItem(name: "txtclr", value: "7F336699")])
    }
    #else
    func testImageOptionsTextColor() {
        imageOptions.textColor = NSColor(red: 0.2, green: 0.4, blue: 0.6, alpha: 0.5)
        XCTAssertEqual(queryItems, [URLQueryItem(name: "txtclr", value: "7F336699")])
    }
    #endif
}
