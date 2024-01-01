//
//  ResourceExtension.swift
//  ProjectDescriptionHelpers
//
//  Created by 김규철 on 2024/01/01.
//

import Foundation
import ProjectDescription

// Resource가 필요한 프로젝트는 프로젝트를 생성할 때 .default로 경로를 설정
public extension ProjectDescription.ResourceFileElements {

    static let `default`: ProjectDescription.ResourceFileElements = ["Resources/**"]

}
