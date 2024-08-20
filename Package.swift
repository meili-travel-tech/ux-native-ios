// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeiliSDK",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MeiliSDK",
            targets: ["MeiliSDK"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
                      name: "MeiliSDK", 
                      url: "https://github.com/meili-travel-tech/ux-native-ios/releases/download/1.0.52/MeiliSDK.xcframework.zip",
                      checksum: "7a8356f1523cc5c46db0aec051f25310c49e93b25d08e2ab3d2d284dd1af4725"
                     )
    ]
)
