//
//  DJResumeTemplate.swift
//  DJResumeTemplate
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Foundation
import ZipArchive

public class DJResumeTemplate {

    /// 模板路径
    private var template: DJTemplete?
    private let resourceBundle: Bundle?
    private let unzipPath = NSTemporaryDirectory().stringByAppendingPathComponent(path: "template")
    /// 简历内容
    public var content: ResumeContent? {
        didSet {
            if let resumeContent = content {
                template?.name.set(resumeContent.name)
                template?.pageTitle.set(resumeContent.title)
                template?.pageDescription.set(resumeContent.pageDescription)
                template?.basicInfo.set(resumeContent.basicInfo())
                template?.information.set(resumeContent.information)
                template?.specialities.set(resumeContent.specialities)
                template?.skillsList.set(resumeContent.skillsList)
                template?.skillsDescription.set(resumeContent.skillsDescription)
                template?.GitHubID.set(resumeContent.githubID)
                template?.community.set(resumeContent.community)
                template?.experience.set(resumeContent.experience)
                template?.project.set(resumeContent.project)
                template?.openSource.set(resumeContent.openSource)
                template?.interests.set(resumeContent.interests)
            }
        }
    }

    public init?(rootPath: String?, basePath: String) throws {
        var path = Bundle.main.path(forResource: "TemplateBundle", ofType: "bundle")
        if path == nil, let rPath = rootPath {
            path = rPath.stringByAppendingPathComponent(path: "DJResumeTemplate.framework/Resources/TemplateBundle.bundle")
        }
        resourceBundle = Bundle(path: path!)
        if resourceBundle != nil, !resourceBundle!.isLoaded {
            resourceBundle?.load()
        }
        let templatePath = resourceBundle?.path(forResource: "template", ofType: "html") ?? ""
        template = try DJTemplete(path: templatePath)
        template?.basePath.set(basePath)
        // 解压压缩包
        if let zipPath = resourceBundle?.path(forResource: "resource", ofType: "zip") {
            SSZipArchive.unzipFile(atPath: zipPath, toDestination: unzipPath)
        }
    }

    deinit {
        // 删除压缩包
        if FileManager.default.fileExists(atPath: unzipPath) {
             try? FileManager.default.removeItem(atPath: unzipPath)
        }
        print("deinit")
    }

    public func generate()  throws -> String{
        let saveTo = unzipPath.stringByAppendingPathComponent(path: "index.html")
        // 打开生成的简历文件
        let resume = try DJFile(path: saveTo)
        // 应用所填入的信息
        resume?.content = template?.apply() ?? ""
        // 保存
        try resume?.save()
        return saveTo
    }
}
