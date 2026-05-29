# MeiliSDK for iOS

Native iOS distribution of MeiliSDK — Meili's car-rental booking experience as a drop-in SwiftUI module.

This repository is the public **distribution channel** for the SDK. The XCFramework binary is attached to each GitHub release; `Package.swift` on this repository's tags is what Swift Package Manager resolves against. Source code lives in a private repository and is not part of this distribution.

## Requirements

- iOS 16.0 or later
- Xcode 15.0 or later
- Swift 5.9 or later

## Installation

### Swift Package Manager (recommended)

In Xcode, choose **File → Add Package Dependencies…** and enter:

```
https://github.com/meili-travel-tech/ux-native-ios
```

Pick a version using Xcode's dependency rules (typically "Up to Next Major"), then add the `MeiliSDK` library product to your app target.

Or, in your own `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/meili-travel-tech/ux-native-ios", from: "1.6.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "MeiliSDK", package: "ux-native-ios")
        ]
    )
]
```

SwiftPM downloads the XCFramework zip from the matching GitHub release asset and verifies it against a SHA256 checksum committed alongside the tagged `Package.swift`.

### CocoaPods

A CocoaPods channel is maintained at [`meili-travel-tech/meili-ios-pods`](https://github.com/meili-travel-tech/meili-ios-pods). Add it as a source and depend on `MeiliSDK`:

```ruby
source 'https://github.com/meili-travel-tech/meili-ios-pods'
source 'https://cdn.cocoapods.org/'

platform :ios, '16.0'

target 'YourApp' do
  pod 'MeiliSDK', '~> 1.6'
end
```

Both channels are first-class and deliver the same compiled XCFramework — the only difference is the integration mechanism. Pick whichever matches your build system.

## Usage

Import the module and configure once at app launch:

```swift
import MeiliSDK

MeiliConfig.shared.configure(
    partnerId: "your-partner-id",
    environment: .production
)
```

Present the SDK's root SwiftUI view from anywhere in your app:

```swift
import SwiftUI
import MeiliSDK

struct ContentView: View {
    var body: some View {
        MeiliRootView()
    }
}
```

See [SampleApp/](SampleApp/) for a working integration example.

## Privacy

The XCFramework ships with a `PrivacyInfo.xcprivacy` manifest covering the SDK's data collection (booking details, payment info, search criteria) and its single Required-Reason API usage (`UserDefaults`, reason `CA92.1`). The manifest also accounts for statically-linked third-party SDKs (Stripe, Evervault, PhoneNumberKit, HorizonCalendar, Shimmer, SwiftUIPager). Host apps must declare any additional categories specific to their own collection.

The SDK does **not** use IDFA, `ASIdentifierManager`, or any cross-app tracking APIs. `NSPrivacyTracking` is set to `false`.

## Versioning

Releases follow semantic versioning. Pre-release tags use the `-alpha.N` / `-beta.N` suffix and are intended for partner integration testing, not production.

## Issues

Bug reports and integration questions: file an issue against this repository. Source-level issues are triaged into the private SDK repo by Meili engineering.

## License

See [LICENSE](LICENSE).
