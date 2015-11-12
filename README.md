# Iris

A Swift micro-framework for working with Imgix.

## Requirements

- Swift 2.1
- iOS 8.0 or later

## Installation

[Carthage](https://github.com/carthage/carthage):

```
github "hodinkee/iris"
```

## Usage

Let's say you have an Imgix [Web Folder](https://www.imgix.com/docs/tutorials/creating-sources#source-web-folder) or [Amazon S3](https://www.imgix.com/docs/tutorials/creating-sources#source-amazon-s3) source setup. You then have a plain URL to an image resource like the one below.

```swift
let myImageURL = NSURL(string: "https://my-source.imgix.net/path/to/my/image")
```

Now, the original image is a rather large 1920x1080px photo of Yosemite, but your app displays it in a 320x180pt view. It would be incredibly wasteful of bandwidth and memory to download the original image. Let's fix that by asking Imgix to resize it for us.

```swift
let displayScale = myImageView.traitCollection.displayScale
let imageOptions = ImageOptions(width: 320, height: 180, scale: displayScale)
let resizedImageURL = myImageURL.imgixURL(imageOptions: imageOptions)
```

Want to ensure the resized image is in the JPEG file format with a quality of 50? Just configure the options!

```swift
imageOptions.format = Format.JPEG
imageOptions.quality = 50
```
