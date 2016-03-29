# Iris

[![Build Status](https://travis-ci.org/hodinkee/iris.svg?branch=master)](https://travis-ci.org/hodinkee/iris)
[![Carthage Compatible](https://img.shields.io/badge/carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Iris.svg)](https://cocoapods.org/pods/Iris)

A Swift framework for working with Imgix.

## Requirements

|  Xcode  |  Swift  |  iOS  |  tvOS  |  OS X  |
| :-----: | :-----: | :---: | :----: | :----: |
| 7.3     | 2.2     | 8.0   | 9.0    | 10.10  |

## Installation

##### [Carthage](https://github.com/carthage/carthage)
> `github "hodinkee/iris"`

#####[CocoaPods](https://github.com/cocoapods/cocoapods)
> `pod 'Iris'`

## Usage

Let's say you have an Imgix [Web Folder](https://www.imgix.com/docs/tutorials/creating-sources#source-web-folder) or [Amazon S3](https://www.imgix.com/docs/tutorials/creating-sources#source-amazon-s3) source setup. You then have a plain URL to an image resource like the one below.

```swift
let imageURL = NSURL(string: "https://my-source.imgix.net/path/to/my/image")
```

Now, the original image is a rather large 1920x1080px photo of Yosemite, but your app displays it in a 320x180pt view. It would be incredibly wasteful of bandwidth and memory to download the original image. Let's fix that by asking Imgix to resize it for us.

```swift
let displayScale = imageView.traitCollection.displayScale
let imageOptions = ImageOptions(width: 320, height: 180, scale: displayScale)
let resizedImageURL = imageURL?.imgixURL(imageOptions: imageOptions)
```

Want to ensure the resized image is in the JPEG file format with a quality of 50? Just configure the options!

```swift
imageOptions.format = .JPEG
imageOptions.quality = 50
```

If you need to sign your Imgix URLs, whether just for security's sake or because you're using a [Web Proxy Source](https://www.imgix.com/docs/tutorials/creating-sources#source-web-proxy), there's a way to do that too!

```swift
let signingOptions = SigningOptions(host: "my-source.imgix.net", token: "FOObar123")
let signedImageURL = imageURL?.imgixURL(imageOptions: imageOptions, signingOptions: signingOptions)
```

