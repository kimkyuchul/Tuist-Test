//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김규철 on 2024/01/01.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: Module.presentation.name,
    dependencies: [Module.domain.project] + [.snapKit, .rxSwift],
    sources: .default
)
