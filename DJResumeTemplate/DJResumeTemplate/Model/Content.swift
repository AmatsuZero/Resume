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

    public var age = 99
    public var name = "你的名字"
    public var sex = Gender.unknown.rawValue
    public var city = "火星"
    public var qq = "1795xxxx91"
    public var mailbox = "xxx@163.com"
    public var phone = "136xxxx5161"
    public var githubID = "无"
    public var title = "一份示例简历"
    public var pageDescription = "xxx 的个人简历"
    public var description = "普通的 iOS 开发"
    public var specialities = [String: Int]()
    public var skillsList = [String: Int]()
    private var _skillsDescription = [String]()
    public var skillsDescription: [String] {
        set(newValue) {
            _skillsDescription = newValue
        }
        get {
            return _skillsDescription.map({$0 + ", "})
        }
    }
    /// 个人经验
    public var experience = [[Int: [String]]]()
    /// 扩展技能
    public var interests = [String: String]()
    /// 项目经验
    public var project = [[String: Any]]()
    public var openSource = [[String: String]]()
    private var weibo = "暂无"
    private var twitter = "暂无"
    private var github = "暂无"
    var information = ["无"]
    public var community = [String: String]()

    public init() {}

    public mutating func setWeibo(link: String, url: String)  {
        weibo = link.a(link: url)
    }

    public mutating func setTwitter(link: String, url: String)  {
        twitter = link.a(link: url)
    }

    public mutating func setGithub(link: String, url: String)  {
        github = link.a(link: url)
    }

    public mutating func setIntroduction(information: [String], strong: [Int] = []) {
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

    public mutating func setProject(projects: [(category: String, proName: String, proDesc: [String])]) {
        project = projects.map({ arg -> [String: Any] in
            return [
                "category": arg.category,
                "pro_name": arg.proName,
                "pro_desc": arg.proDesc
            ]
        })
    }

    public mutating func setOpenSource(projects: [(name: String, title: String, desc: String, link: String)]) {
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

