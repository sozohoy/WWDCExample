// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "YelsonExample",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "YelsonExample",
            targets: ["AppModule"],
            bundleIdentifier: "com.wwdcStudentChallenge.YelsonExample",
            teamIdentifier: "8R3N359429",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .binoculars),
            accentColor: .presetColor(.orange),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Boris-Em/ColorKit.git", .branch("master"))
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "ColorKit", package: "colorkit")
            ],
            path: "."
        )
    ]
)