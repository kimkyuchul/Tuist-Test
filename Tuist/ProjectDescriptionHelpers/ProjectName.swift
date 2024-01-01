//
//  ProjectName.swift
//  ProjectDescriptionHelpers
//
//  Created by 김규철 on 2024/01/01.
//

import ProjectDescription

// 모듈 이름, 경로
public enum Module: CaseIterable {
    case app
    // Repository|DataStore
    case data
    // Presentation
    case presentation
    // Domain
    case domain
    // Design|UI
    case designSystem
}

extension Module {
    public var name: String {
        switch self {
        case .app:
            return "App"
        case .data:
            return "Data"
        case .presentation:
            return "Presentation"
        case .domain:
            return "Domain"
        case .designSystem:
            return "DesignSystem"
        }
    }
    
    public var path: ProjectDescription.Path {
        return .relativeToRoot("Projects/" + self.name)
    }
    
    public var project: TargetDependency {
        return .project(target: self.name, path: self.path)
    }
}
