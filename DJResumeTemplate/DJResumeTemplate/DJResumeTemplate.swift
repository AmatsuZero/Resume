//
//  DJResumeTemplate.swift
//  DJResumeTemplate
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Foundation

public class DJResumeTemplate {

    /// 模板路径
    private let template: DJTemplete?
    /// 简历内容
    var content: ResumeContent? {
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

    var saveTo: String = (NSTemporaryDirectory() as NSString).appending("index.html")

    public init?(basePath: String) throws {
        template = try DJTemplete(path: DJPath.templete)
        template?.basePath.set(basePath)
    }

    public func generate() throws {
        // 打开生成的简历文件
        let resume = try DJFile(path: saveTo)
        // 应用所填入的信息
        resume?.content = template?.apply() ?? ""
        // 保存
        try resume?.save()
    }
}
