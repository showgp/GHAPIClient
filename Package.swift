// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GHAPIClient",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "GHAPIClient",
            targets: ["GHAPIClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.0.0-rc.3")
    ],
    targets: [
        .target(
            name: "GHAPIClient",
            dependencies: [
                "Alamofire",
            ]
        ),
        .testTarget(
            name: "GHAPIClientTests",
            dependencies: ["GHAPIClient"]),
    ]
)
