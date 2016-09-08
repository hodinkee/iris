//
//  ImageOptionsTests.swift
//  Iris
//
//  Created by Jonathan Baker on 11/12/15.
//  Copyright © 2015 HODINKEE. All rights reserved.
//

import XCTest
@testable import Iris

final class ImageOptionsTests: XCTestCase {

    // MARK: - Test Case Properties

    fileprivate var imageOptions: ImageOptions = ImageOptions()

    fileprivate var queryItems: [URLQueryItem] {
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
        let imageOptionsOne = ImageOptions(format: .JPEG, width: 320, height: 250)
        let imageOptionsTwo = ImageOptions(format: .JPEG, width: 320, height: 250)
        XCTAssertEqual(imageOptionsOne, imageOptionsTwo)
    }

    // MARK: - Adjustment Properties

    func testImageOptionsBrightness() {
        imageOptions.brightness = -500
        XCTAssertEqual(imageOptions.brightness, -100)

        imageOptions.brightness = 500
        XCTAssertEqual(imageOptions.brightness, 100)

        imageOptions.brightness = 75
        XCTAssertEqual(imageOptions.brightness, 75)
        XCTAssert(queryItems.contains(URLQueryItem(name: "bri", value: "75")))
    }

    func testImageOptionsContrast() {
        imageOptions.contrast = -500
        XCTAssertEqual(imageOptions.contrast, -100)

        imageOptions.contrast = 500
        XCTAssertEqual(imageOptions.contrast, 100)

        imageOptions.contrast = 75
        XCTAssertEqual(imageOptions.contrast, 75)
        XCTAssert(queryItems.contains(URLQueryItem(name: "con", value: "75")))
    }

    func testImageOptionsExposure() {
        imageOptions.exposure = -500
        XCTAssertEqual(imageOptions.exposure, -100)

        imageOptions.exposure = 500
        XCTAssertEqual(imageOptions.exposure, 100)

        imageOptions.exposure = 75
        XCTAssertEqual(imageOptions.exposure, 75)
        XCTAssert(queryItems.contains(URLQueryItem(name: "exp", value: "75")))
    }

    func testImageOptionsGamma() {
        imageOptions.gamma = -500
        XCTAssertEqual(imageOptions.gamma, -100)

        imageOptions.gamma = 500
        XCTAssertEqual(imageOptions.gamma, 100)

        imageOptions.gamma = 75
        XCTAssertEqual(imageOptions.gamma, 75)
        XCTAssert(queryItems.contains(URLQueryItem(name: "gam", value: "75")))
    }

    func testImageOptionsHighlight() {
        imageOptions.highlight = -500
        XCTAssertEqual(imageOptions.highlight, -100)

        imageOptions.highlight = 500
        XCTAssertEqual(imageOptions.highlight, 100)

        imageOptions.highlight = 75
        XCTAssertEqual(imageOptions.highlight, 75)
        XCTAssert(queryItems.contains(URLQueryItem(name: "high", value: "75")))
    }

    func testImageOptionsHue() {
        imageOptions.hue = -500
        XCTAssertEqual(imageOptions.hue, 0)

        imageOptions.hue = 500
        XCTAssertEqual(imageOptions.hue, 359)

        imageOptions.hue = 75
        XCTAssertEqual(imageOptions.hue, 75)
        XCTAssert(queryItems.contains(URLQueryItem(name: "hue", value: "75")))
    }

    func testImageOptionsInvert() {
        imageOptions.invert = true
        XCTAssertEqual(imageOptions.invert, true)
        XCTAssert(queryItems.contains(URLQueryItem(name: "invert", value: "true")))
    }

    func testImageOptionsSaturation() {
        imageOptions.saturation = -500
        XCTAssertEqual(imageOptions.saturation, -100)

        imageOptions.saturation = 500
        XCTAssertEqual(imageOptions.saturation, 100)

        imageOptions.saturation = 75
        XCTAssertEqual(imageOptions.saturation, 75)
        XCTAssert(queryItems.contains(URLQueryItem(name: "sat", value: "75")))
    }

    func testImageOptionsShadow() {
        imageOptions.shadow = -500
        XCTAssertEqual(imageOptions.shadow, -100)

        imageOptions.shadow = 500
        XCTAssertEqual(imageOptions.shadow, 100)

        imageOptions.shadow = 75
        XCTAssertEqual(imageOptions.shadow, 75)
        XCTAssert(queryItems.contains(URLQueryItem(name: "shad", value: "75")))
    }

    func testImageOptionsSharpen() {
        imageOptions.sharpen = -500
        XCTAssertEqual(imageOptions.sharpen, 0)

        imageOptions.sharpen = 500
        XCTAssertEqual(imageOptions.sharpen, 100)

        imageOptions.sharpen = 75
        XCTAssertEqual(imageOptions.sharpen, 75)
        XCTAssert(queryItems.contains(URLQueryItem(name: "sharp", value: "75")))
    }

    func testImageOptionsVibrance() {
        imageOptions.vibrance = -500
        XCTAssertEqual(imageOptions.vibrance, -100)

        imageOptions.vibrance = 500
        XCTAssertEqual(imageOptions.vibrance, 100)

        imageOptions.vibrance = 75
        XCTAssertEqual(imageOptions.vibrance, 75)
        XCTAssert(queryItems.contains(URLQueryItem(name: "vib", value: "75")))
    }

    // MARK: - Size Properties

    func testImageOptionsWidth() {
        imageOptions.width = 320
        XCTAssertEqual(imageOptions.width, 320)
        XCTAssert(queryItems.contains(URLQueryItem(name: "w", value: "320.0")))
    }

    func testImageOptionsHeight() {
        imageOptions.height = 250
        XCTAssertEqual(imageOptions.height, 250)
        XCTAssert(queryItems.contains(URLQueryItem(name: "h", value: "250.0")))
    }

    func testImageOptionsFit() {
        imageOptions.fit = .Crop
        XCTAssertEqual(imageOptions.fit, .Crop)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fit", value: "crop")))

        imageOptions.fit = .Clip
        XCTAssertEqual(imageOptions.fit, .Clip)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fit", value: "clip")))

        imageOptions.fit = .Clamp
        XCTAssertEqual(imageOptions.fit, .Clamp)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fit", value: "clamp")))

        imageOptions.fit = .FaceArea
        XCTAssertEqual(imageOptions.fit, .FaceArea)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fit", value: "facearea")))

        imageOptions.fit = .Fill
        XCTAssertEqual(imageOptions.fit, .Fill)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fit", value: "fill")))

        imageOptions.fit = .Max
        XCTAssertEqual(imageOptions.fit, .Max)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fit", value: "max")))

        imageOptions.fit = .Min
        XCTAssertEqual(imageOptions.fit, .Min)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fit", value: "min")))

        imageOptions.fit = .Scale
        XCTAssertEqual(imageOptions.fit, .Scale)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fit", value: "scale")))
    }

    func testImageOptionsScale() {
        imageOptions.scale = 2.0
        XCTAssertEqual(imageOptions.scale, 2.0)
        XCTAssert(queryItems.contains(URLQueryItem(name: "dpr", value: "2.0")))
    }

    func testImageOptionsCrop() {
        imageOptions.crop = [.Top]
        XCTAssertEqual(imageOptions.crop?.first, .Top)
        XCTAssert(queryItems.contains(URLQueryItem(name: "crop", value: "top")))

        imageOptions.crop = [.Bottom]
        XCTAssertEqual(imageOptions.crop?.first, .Bottom)
        XCTAssert(queryItems.contains(URLQueryItem(name: "crop", value: "bottom")))

        imageOptions.crop = [.Left]
        XCTAssertEqual(imageOptions.crop?.first, .Left)
        XCTAssert(queryItems.contains(URLQueryItem(name: "crop", value: "left")))

        imageOptions.crop = [.Right]
        XCTAssertEqual(imageOptions.crop?.first, .Right)
        XCTAssert(queryItems.contains(URLQueryItem(name: "crop", value: "right")))

        imageOptions.crop = [.Faces]
        XCTAssertEqual(imageOptions.crop?.first, .Faces)
        XCTAssert(queryItems.contains(URLQueryItem(name: "crop", value: "faces")))

        imageOptions.crop = [.Entropy]
        XCTAssertEqual(imageOptions.crop?.first, .Entropy)
        XCTAssert(queryItems.contains(URLQueryItem(name: "crop", value: "entropy")))

        imageOptions.crop = [.Top, .Left]
        XCTAssert(queryItems.contains(URLQueryItem(name: "crop", value: "top,left")))
    }

    func testImageOptionsCropRect() {
        imageOptions.cropRect = CGRect.zero
        XCTAssertFalse(queryItems.contains(URLQueryItem(name: "rect", value: nil)))

        imageOptions.cropRect = CGRect(x: 10, y: 20, width: 30, height: 40)
        XCTAssertFalse(queryItems.contains(URLQueryItem(name: "rect", value: "10,20,30,40")))
    }

    // MARK: - Format Properties

    func testImageOptionsFormat() {
        imageOptions.format = .JPEG
        XCTAssertEqual(imageOptions.format, .JPEG)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fm", value: "jpg")))

        imageOptions.format = .PNG
        XCTAssertEqual(imageOptions.format, .PNG)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fm", value: "png")))

        imageOptions.format = .JSON
        XCTAssertEqual(imageOptions.format, .JSON)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fm", value: "json")))

        imageOptions.format = .MP4
        XCTAssertEqual(imageOptions.format, .MP4)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fm", value: "mp4")))

        imageOptions.format = .WebP
        XCTAssertEqual(imageOptions.format, .WebP)
        XCTAssert(queryItems.contains(URLQueryItem(name: "fm", value: "webp")))
    }

    func testImageOptionsDPI() {
        imageOptions.DPI = 320
        XCTAssertEqual(imageOptions.DPI, 320)
        XCTAssert(queryItems.contains(URLQueryItem(name: "dpi", value: "320")))
    }

    func testImageOptionsLossless() {
        imageOptions.lossless = true
        XCTAssertEqual(imageOptions.lossless, true)
        XCTAssert(queryItems.contains(URLQueryItem(name: "lossless", value: "true")))
    }

    func testImageOptionsQuality() {
        imageOptions.quality = -50
        XCTAssertEqual(imageOptions.quality, 0)

        imageOptions.quality = 200
        XCTAssertEqual(imageOptions.quality, 100)

        imageOptions.quality = 75
        XCTAssertEqual(imageOptions.quality, 75)
        XCTAssert(queryItems.contains(URLQueryItem(name: "q", value: "75")))
    }

    func testImageOptionsColorQuantization() {
        imageOptions.colorQuantization = 0
        XCTAssertEqual(imageOptions.colorQuantization, 2)

        imageOptions.colorQuantization = 512
        XCTAssertEqual(imageOptions.colorQuantization, 256)

        imageOptions.colorQuantization = 75
        XCTAssertEqual(imageOptions.colorQuantization, 75)
        XCTAssert(queryItems.contains(URLQueryItem(name: "colorquant", value: "75")))
    }

    // MARK: - Background Properties

    #if os(iOS) || os(tvOS)
    func testImageOptionsBackgroundColor() {
        let color = UIColor(red: 51.0/255.0, green: 102.0/255.0, blue: 153.0/255.0, alpha: 0.5)
        imageOptions.backgroundColor = color
        XCTAssertEqual(imageOptions.backgroundColor as? UIColor, color)
        XCTAssert(queryItems.contains(URLQueryItem(name: "bg", value: "7F336699")))
    }
    #endif
}
