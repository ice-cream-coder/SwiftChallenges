// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftChallenges",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Nacci",
            dependencies: [
                .product(name: "BigInt", package: "BigInt")
            ]),
        .target(
            name: "Futoshiki",
            dependencies: [],
            resources: [
                .copy("Description.md"),
                .copy("InequalityPuzzle-Example.png"),
                .copy("InequalityPuzzle-Order.png"),
                .copy("InequalityPuzzle-Solution.png")
            ]),
        .testTarget(
            name: "ProblemTests",
            dependencies: ["Nacci", "Futoshiki"]),
    ]
)
