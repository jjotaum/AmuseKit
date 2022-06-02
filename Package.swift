// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AmuseKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "AmuseKit",
            targets: ["AmuseKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "AmuseKit",
            dependencies: ["KeychainAccess"]),
        .testTarget(
            name: "AmuseKitTests",
            dependencies: ["AmuseKit"],
            resources: [.process("DataModels")]),
    ]
)
