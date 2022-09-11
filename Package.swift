import PackageDescription

let package = Package(
    name: "CLArgumentsParser",
    products: [
        .library(name: "CLArgumentsParser", targets: ["CLArgumentsParser"]),
    ],
    dependencies: [
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
