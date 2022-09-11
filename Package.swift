// swift-tools-version:5.5.0

import PackageDescription

let package = Package(
    name: "CLArgumentsParser",
    products: [
        .library(name: "CLArgumentsParser", targets: ["CLArgumentsParser"]),
    ],
    targets: [
        .target(
            name: "CLArgumentsParser",
            dependencies: []),
        .testTarget(
            name: "CLArgumentsParserTests",
            dependencies: ["CLArgumentsParser"]),
    ]
)
