// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NomadUtilities",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "NomadUtilities", targets: ["NomadUtilities"]),
        .library(name: "NomadFirebase", targets: ["NomadFirebase"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/sindresorhus/Defaults.git", .upToNextMajor(from: "9.0.0")),
        .package(url: "https://github.com/yeahdongcn/UIColor-Hex-Swift.git", from: "5.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "NomadUtilities",
            dependencies: [
                .product(name: "Defaults", package: "Defaults"),
                .product(name: "UIColorHexSwift", package: "UIColor-Hex-Swift"),
            ]
        ),
        .target(
            name: "NomadFirebase",
            dependencies: ["NomadUtilities"]),
        .testTarget(
            name: "NomadUtilitiesTests",
            dependencies: ["NomadUtilities"]),
    ]
)
