# HummingKit

HummingKit is an SDK (Software Development Kit) designed to ease the use of [Apple Music API](https://developer.apple.com/documentation/applemusicapi). Written in Swift 5.2, HummingKit takes advantage of Swift's outstanding performance and latest features, offering an approachable entry for developers dealing with the Apple Music API.

## Features

HummingKit provides a friendly way to deal with the Apple Music API by handling burdensome works, such as composing and conducting requests, handling status and errors, parsing responses and more.

- [x] Apple Music API High Coverage
- [x] Apple Music API User Privacy Verification
- [x] Apple Music API Request Authentication
- [x] Apple Music API Request URL / JSON Parameter Encoding
- [x] Apple Music API Request Pagination
- [x] Apple Music API Request Asynchronous Status Handling
- [x] Apple Music API Response Decoding
- [x] Apple Music API Resource Relationships Fetching
- [ ] Complete Documentation (In Progress)

## Requirements

- Swift 5.2+
- Xcode 11+
- iOS 11.0+ / macOS 10.13+ * / tvOS 11.0+ / watchOS 4.0+ *
    (*) For certain functionalities, macOS 11.0+ / watchOS 7.0+ are required.

## Integration

HummingKit comes with flexibility in terms of integration. From [importing it as a dependency of your projects](In-Your-Xcode-Project), to [building frameworks upon it](In-Your-Framework), HummingKit provides an optimal integration solution.

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code specifically. HummingKit supports Swift Package from design.

---
**NOTE**

Once a Swift Package is added to an Xcode project, the package's dependency repositories are also added to the project automatically. HummingKit is of no exception of this rule.

---

#### In Your Xcode Project

When your project is opened in Xcode, select ``` File > Swift Packages > Add Package Dependency``` from the menu bar. Enter ```https://github.com/TonyTang2001/HummingKit.git``` once prompted to do so. After specifying ```Rules``` in accordance to your need, HummingKit is successfully added to your project as a Swift Package.

#### In Your Framework

Once your Swift package is set up, add HummingKit as a dependency by adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/TonyTang2001/HummingKit.git", .upToNextMajor(from: "0.9.0"))
]
```

## Dependencies

HummingKit is built upon widely-adopted frameworks for a portion of its functionality.

- [Alamofire](https://github.com/Alamofire/Alamofire)
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)

