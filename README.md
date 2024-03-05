MeiliSDK: A Powerful iOS Integration for Meili
----------------------------------------------------------------

Meili iOS SDK empowers developers to seamlessly integrate the capabilities of Meili into their iOS applications. This robust solution streamlines the development process, offering various integration methods to cater to diverse preferences.

## Features

- Simplify integration with Meili.
- Support for iOS 16.0+ and Swift 5.9+.
- Easy installation via Swift Package Manager, CocoaPods, or manual import.

Requirements:

-   iOS Version: 16.0 or higher
-   Swift Version: 5.9 or higher

Installation:

Meili iOS SDK offers flexible installation options to suit your project's requirements:

1\. Swift Package Manager:

Swift Package Manager is an integrated tool for managing Swift dependencies within Xcode projects. To install MeiliSDK using SPM, follow these steps:

a. Add the following line to the `dependencies` section of your `Package.swift` file:


```swift
.package(url: "https://github.com/hmarques98/meili-ios", from: "1.0.21")
```

b. Add MeiliSDK to your target's dependencies:


```swift
targets: [
    .target(
        name: "YourTargetName",
        dependencies: ["MeiliSDK"]
    )
]

```

2\. CocoaPods:

CocoaPods is a popular dependency management tool for Cocoa projects. To install MeiliSDK using CocoaPods:

a. Add the following line to your Podfile:



```ruby
pod 'MeiliSDK', '~> 1.0.1'

```

b. Run the following command in your terminal:



```bash
pod install

```

3\. Manual Framework Import:

If you prefer not to use dependency managers, you can integrate MeiliSDK manually:

a. Download the MeiliSDK.xcframework file. b. Unzip the downloaded file and drag the MeiliSDK.xcframework file into the "Frameworks, Libraries, and Embedded Content" section of your Xcode project's "General" settings. c. Ensure that "Copy items if needed" and "Embed & Sign" are selected in the "Embed" section.

Usage:

Once installation is complete, import MeiliSDK at the beginning of your Swift file:



```swift
import MeiliSDK
```

Start utilizing the functionalities as documented in the MeiliSDK library to leverage the power of Meili within your iOS application.
