//
//  Content.swift
//  DJResumeTemplate
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Foundation

public struct ResumeContent {

    public enum Gender: String {
        case man = "男"
        case woman = "女"
        case unknown = "未知"
    }

    var age = 99
    var name = "你的名字"
    var sex = Gender.unknown.rawValue
    var city = "火星"
    var qq = "1795xxxx91"
    var mailbox = "xxx@163.com"
    var phone = "136xxxx5161"
    var githubID = "无"
    var title = "一份示例简历"
    var pageDescription = "xxx 的个人简历"
    var description = "普通的 iOS 开发"
    var specialities = [String: Int]()
    var skillsList = [String: Int]()
    var skillsDescription: [String] {
        get {
            return self.skillsDescription.map({$0 + ", "})
        }
    }
    /// 个人经验
    var experience = [Int: [String]]()
    /// 扩展技能
    var interests = [String: String]()
    /// 项目经验
    var project = [[String: Any]]()
    var openSource = [[String: String]]()
    private var weibo = "暂无"
    private var twitter = "暂无"
    private var github = "暂无"
    var information = ["无"]
    var community = [String: String]()

    mutating func setWeibo(link: String, url: String)  {
        weibo = link.a(link: url)
    }

    mutating func setTwitter(link: String, url: String)  {
        twitter = link.a(link: url)
    }

    mutating func setGithub(link: String, url: String)  {
        github = link.a(link: url)
    }

    mutating func setIntroduction(information: [String], strong: [Int] = []) {
        var newInfo = [String]()
        for (index, info) in information.enumerated() {
            if strong.contains(index) {
                newInfo.append(info.strong())
            } else {
                newInfo.append(info)
            }
        }
        self.information = newInfo
    }

    mutating func setProject(projects: [(category: String, proName: String, proDesc: [String])]) {
        project = projects.map({ arg -> [String: Any] in
            return [
                "category": arg.category,
                "pro_name": arg.proName,
                "pro_desc": arg.proDesc
            ]
        })
    }

    mutating func setOpenSource(projects: [(name: String, title: String, desc: String, link: String)]) {
        openSource = projects.map({ arg -> [String: String] in
            return [
                "name": arg.name,
                "title": arg.title,
                "description": arg.desc,
                "link": arg.link
            ]
        })
    }

    func basicInfo() -> [String: [String]] {
        return [
            "基本信息": [
                "年龄：\(age)",
                "性别：\(sex)",
                "城市：\(city)"
            ],
            "联系方式": [
                "QQ：\(qq)",
                "邮箱：\(mailbox)",
                "手机：\(phone)"
            ],
            "社交账号": [
                "微博：\(weibo)",
                "Twitter: \(twitter)",
                "GitHub：\(github)"
            ]
        ]
    }
}

