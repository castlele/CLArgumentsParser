// swift-tools-version:5.5.0

import PackageDescription

let package = Package(
    name: "CLArgumentsParser",
    products: [
        .library(name: "CLArgumentsParser", targets: ["CLArgumentsParser"]),
    ],
    dependencies: [
        .package(url: "git@github.com:castlele/CLArgumentsParser.git", .branch("master")),
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
