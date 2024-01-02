//
//  Dependencies.swift
//  Config
//
//  Created by 김규철 on 2024/01/03.
//

import ProjectDescription

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: [
            .rxSwift,
            .snapKit
    ],
    platforms: [.iOS]
)

// Package Extension 을 통해 패키지를 불러올 경로를 설정
public extension Package {
    static let rxSwift: Package = .remote(url: "https://github.com/ReactiveX/RxSwift", requirement: .branch("main"))
    static let snapKit: Package = .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMinor(from: "5.0.1"))
}

