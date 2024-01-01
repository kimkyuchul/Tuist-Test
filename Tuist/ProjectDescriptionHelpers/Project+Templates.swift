import ProjectDescription


// Project+Templete 구현
// App 프로젝트는 Application으로 나머지 프로젝트는 Framework으로 구성할것이기 때문에 Templete파일에는 app과 framework프로젝트를 생성하는 코드를 작성

extension Project {
    
    static let bundleID = "com.learnSwift.TuistTest"
    static let iOSTargetVersion = "15.0"
    
    // App, Framework 템플릿 작성에 앞서 project 자체를 생성하는 템플릿
    // name: 프로젝트 이름
    // product: Product Type -> app, library, framework, test, appExtension, watch2App 등
    // deploymentTarget: 앱의 최소 타겟버전, 가능 디바이스
    // infoPlist: default로 설정 시 프로젝트마다 infoPlist를 생성 현재 생성되는 프로젝트는 하나의 infoPlist를 사용하고자 하나의 plist를 바라보도록 경로를 설정
    // sources: 코드가 들어갈 경로
    // Tests타겟의 경우에는 Tests라는 폴더로 경로
    // dependencies는 외부에서 주입할 Framework, Library등을 작성
    public static func project(
        name: String,
        product: Product,
        bundleID: String,
        schemes: [Scheme] = [],
        dependencies: [TargetDependency] = [],
        resources: ProjectDescription.ResourceFileElements? = nil
    ) -> Project {
        return Project(
            name: name,
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: product,
                    bundleId: bundleID,
                    deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: [.iphone, .ipad]),
                    infoPlist: .file(path: .relativeToRoot("Supporting Files/Info.plist")),
                    sources: ["Sources/**"],
                    resources: resources,
                    dependencies: dependencies
                ),
                Target(
                    name: "\(name)Tests",
                    platform: .iOS,
                    product: .unitTests,
                    bundleId: bundleID,
                    deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: [.iphone, .ipad]),
                    infoPlist: .file(path: .relativeToRoot("Supporting Files/Info.plist")),
                    sources: "Tests/**",
                    dependencies: [
                        .target(name: "\(name)")
                    ]
                )
            ],
            schemes: schemes
        )
    }
    
    // product를 app으로 생성
    public static func app(
            name: String,
            dependencies: [TargetDependency] = [],
            resources: ProjectDescription.ResourceFileElements? = nil
        ) -> Project {
            return self.project(
                name: name,
                product: .app,
                bundleID: bundleID + "\(name)",
                dependencies: dependencies,
                resources: resources
            )
        }
    
    // product를 framework로 생성
    public static func framework(name: String,
                                     dependencies: [TargetDependency] = [],
                                     resources: ProjectDescription.ResourceFileElements? = nil
        ) -> Project {
            return .project(name: name,
                            product: .framework,
                            bundleID: bundleID + ".\(name)",
                            dependencies: dependencies,
                            resources: resources)
        }
}
