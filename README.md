# MeiliCarSDK for iOS

Native iOS distribution of MeiliCarSDK — Meili's car-rental booking experience as a drop-in SwiftUI module.

This repository is the public **distribution channel** for the SDK. The XCFramework binary is attached to each GitHub release; `Package.swift` on this repository's tags is what Swift Package Manager resolves against. Source code lives in a private repository and is not part of this distribution.

## Requirements

- **iOS 15.0 or later** to integrate. The native booking funnel itself requires iOS 16.0 — on iOS 15, `MeiliCarView` falls back to a web/message presentation instead of not compiling; see [Usage](#usage).
- Xcode 15.0 or later
- Swift 5.9 or later

## Installation

### Swift Package Manager (recommended)

In Xcode, choose **File → Add Package Dependencies…** and enter:

```
https://github.com/meili-travel-tech/ux-native-ios
```

Pick a version using Xcode's dependency rules (typically "Up to Next Major"), then add the `MeiliCarSDK` library product to your app target.

Or, in your own `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/meili-travel-tech/ux-native-ios", from: "1.12.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "MeiliCarSDK", package: "ux-native-ios")
        ]
    )
]
```

SwiftPM downloads the XCFramework zip from the matching GitHub release asset and verifies it against a SHA256 checksum committed alongside the tagged `Package.swift`.

### CocoaPods

A CocoaPods channel is maintained at [`meili-travel-tech/meili-ios-pods`](https://github.com/meili-travel-tech/meili-ios-pods). Add it as a source and depend on `MeiliCarSDK`:

```ruby
source 'https://github.com/meili-travel-tech/meili-ios-pods'
source 'https://cdn.cocoapods.org/'

platform :ios, '15.0'

target 'YourApp' do
  pod 'MeiliCarSDK', '~> 1.12'
end
```

Both channels are first-class and deliver the same compiled XCFramework — the only difference is the integration mechanism. Pick whichever matches your build system.

## Usage

Import the module and present the SDK's entry view from anywhere in your app:

```swift
import SwiftUI
import MeiliCarSDK

struct ContentView: View {
    @State private var showMeili = false

    var body: some View {
        Button("Book a car") { showMeili = true }
            .sheet(isPresented: $showMeili) {
                MeiliCarView(with: MeiliCarParams(
                    ptid: "your-ptid",
                    flow: .direct,
                    env: .prod
                ))
            }
    }
}
```

`MeiliCarParams` also takes `availParams`/`additionalParams` to seed a search, `dismissAction` and
`onEndBookingFlow` callbacks, `colorScheme`, and `verboseLogging`. `MeiliCarFlow` is one of
`.direct`, `.connect` or `.bookingManager`; `MeiliCarEnvironment` is one of `.dev`, `.uat`,
`.preProd` or `.prod`.

On iOS 15, `MeiliCarView` does **not** render the native funnel — it routes the traveller to the
web equivalent, or shows a "requires a newer iOS" message where there's no web equivalent. Check
`MeiliCarSupport.isNativeFunnelAvailable` if you'd rather route somewhere of your own, or hide your
entry point entirely, on iOS 15.

A headless, stateless [Query API](https://github.com/meili-travel-tech/ux-native-ios-sdk/blob/main/docs/query-api-contract.md)
(`MeiliCarQueryClient`) is fully functional on iOS 15, for building your own availability carousel
ahead of a deeplink into the funnel.

See [SampleApp/](SampleApp/) for a working integration example.

## Previous name

This SDK shipped as **`MeiliSDK`** through version `1.11.1`. As of `1.12.0` it ships only as
**`MeiliCarSDK`** — the module, SwiftPM product and CocoaPods pod all carry the product name so a
future second Meili product (e.g. hotels) can never collide with it. The `MeiliSDK` product and pod
**stay published and frozen at `1.11.1`**: existing `from:`/`upToNextMajor` pins keep resolving, and
you can roll back to it at any time. New releases publish only under the `MeiliCarSDK` name. See the
[MeiliCarSDK changelog](https://github.com/meili-travel-tech/ux-native-ios-sdk/blob/main/CHANGELOG.md)
for the full symbol rename table.

## Privacy

The XCFramework ships with a `PrivacyInfo.xcprivacy` manifest covering the SDK's data collection (booking details, payment info, search criteria) and its single Required-Reason API usage (`UserDefaults`, reason `CA92.1`). The manifest also accounts for statically-linked third-party SDKs (PhoneNumberKit, HorizonCalendar, Shimmer, SwiftUIPager). Host apps must declare any additional categories specific to their own collection.

The SDK does **not** use IDFA, `ASIdentifierManager`, or any cross-app tracking APIs. `NSPrivacyTracking` is set to `false`.

## Versioning

Releases follow semantic versioning. Pre-release tags use the `-alpha.N` / `-beta.N` suffix and are intended for partner integration testing, not production.

## Issues

Bug reports and integration questions: file an issue against this repository. Source-level issues are triaged into the private SDK repo by Meili engineering.

## License

See [LICENSE](LICENSE).
