// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LLM",
    platforms: [
        .macOS(.v12),
        .iOS(.v14),
        .visionOS(.v1),
        .watchOS(.v4),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "LLM",
            targets: ["LLM"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ggerganov/llama.cpp/", revision: "cda0e4b648dde8fac162b3430b14a99597d3d74f"),
        .package(url: "https://github.com/kishikawakatsumi/swift-power-assert", from: "0.12.0"),
    ],
    targets: [
        .target(
            name: "LLM",
            dependencies: [
                .product(name: "llama", package: "llama.cpp")
            ]),
        .testTarget(
            name: "LLMTests",
            dependencies: [
                .product(name: "PowerAssert", package: "swift-power-assert"),
                "LLM"
            ]),
    ]
)
