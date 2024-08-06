// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "swift-macro-testing",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "MacroTesting",
      targets: ["MacroTesting"]
    )
  ],
  dependencies: [
	.package(url: "https://github.com/pedrolopessh/swift-snapshot-testing", branch: "swift-syntax-test"),
	.package(url: "https://github.com/sjavora/swift-syntax-xcframeworks.git", exact: "510.0.1"),
  ],
  targets: [
    .target(
      name: "MacroTesting",
      dependencies: [
        .product(name: "InlineSnapshotTesting", package: "swift-snapshot-testing"),
		.product(name: "SwiftSyntaxWrapper", package: "swift-syntax-xcframeworks"),
//        .product(name: "SwiftDiagnostics", package: "swift-syntax"),
//        .product(name: "SwiftOperators", package: "swift-syntax"),
//        .product(name: "SwiftParserDiagnostics", package: "swift-syntax"),
//        .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
//        .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
      ]
    ),
    .testTarget(
      name: "MacroTestingTests",
      dependencies: [
        "MacroTesting"
      ]
    ),
  ]
)
