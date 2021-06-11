// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "Device",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "Device",
            targets: ["Device"]
        )
    ],
    dependencies: [
        .package(name: "AppLogger", url: "https://github.com/backslash-f/applogger", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "Device",
            dependencies: ["AppLogger"]
        ),
        .testTarget(
            name: "DeviceTests",
            dependencies: ["Device"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
