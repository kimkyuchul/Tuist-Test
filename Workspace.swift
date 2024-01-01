//
//  Workspace.swift
//  ProjectDescriptionHelpers
//
//  Created by 김규철 on 2024/01/01.
//

import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(name: "Projects",
                          projects: Module.allCases.map(\.path))
