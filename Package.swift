// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeiliCarSDK",
    platforms: [.iOS("15.0")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MeiliCarSDK",
            targets: ["MeiliCarSDK"]),
        // Frozen at 1.11.1 — the pre-rename product. New releases ship only as MeiliCarSDK above;
        // this stays published so existing `from:`/`upToNextMajor` pins keep resolving.
        .library(
            name: "MeiliSDK",
            targets: ["MeiliSDK"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
                      name: "MeiliCarSDK",
                      url: "https://github.com/meili-travel-tech/ux-native-ios/releases/download/1.13.0/MeiliCarSDK.xcframework.zip",
                      checksum: "7ca602d77a3e486a7e087dc174d1c53b231e614a1343d56e7ced05c93308b604"
                     ),
        // Frozen at 1.11.1 — do not update this target's url/checksum. New releases publish a new
        // MeiliCarSDK target above; this one stays pinned so old consumers keep resolving.
        .binaryTarget(
                      name: "MeiliSDK",
                      url: "https://github.com/meili-travel-tech/ux-native-ios/releases/download/1.11.1/MeiliSDK.xcframework.zip",
                      checksum: "c5b06389889eded92ccfcdf7dbc4470f5afd520adddda02591047af2e5bcc48c"
                     )
    ]
)
