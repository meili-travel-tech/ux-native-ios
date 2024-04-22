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
                      url: "https://github.com/meili-travel-tech/ux-native-ios/releases/download/1.0.36/MeiliSDK-1.0.36.xcframework.zip",
                      checksum: "f6040c0f479b5e04e41450f9116f98892c9ef8a76583f01a783ce1c44990e332"
                     )
    ]
)
