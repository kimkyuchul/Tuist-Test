//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김규철 on 2024/01/01.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(name: Module.app.name,
                          dependencies: [
                            Module.domain,
                            Module.data,
                            Module.presentation,
                            Module.designSystem
                          ].map(\.project),
                          infoPlist: .file(path: "Support/Info.plist"),
                          sources: .default,
                          resources: .default)
