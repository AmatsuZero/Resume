//
//  ViewController.swift
//  ResumeDisplay
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Cocoa
import DJResumeTemplate

class ViewController: NSViewController {

    var template: DJResumeTemplate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Fill Content
        do {
            template = try DJResumeTemplate(rootPath: Bundle.main.privateFrameworksPath,
                                            basePath: "https://eyrefree.github.io/EFResume")

            template?.content = fillContent()
        } catch(let e) {
            print("初始化失败！\(e.localizedDescription)")
        }
        do {
            if let path = try template?.generate() {
                print("\(path)")
            }
        } catch(let e) {
            print("\(e.localizedDescription)")
        }
    }

    func fillContent() -> ResumeContent {
        var content = ResumeContent()
        content.name = "姜振华"
        content.age = 31
        content.city = "北京"
        content.qq = "741602428"
        content.mailbox = "jzh16s@gmail.com"
        content.phone = "13905355320"
        content.setWeibo(link: "@Amatsuzero", url: "https://weibo.com/amatsuzero")
        content.setTwitter(link: "@eyrefree777", url: "https://twitter.com/EyreFree777")
        content.setGithub(link: "Amatsuzero", url: "https://github.com/Amatsuzero")
        content.setIntroduction(information: [
            "目前就职于饿了么，主要负责xxx的开发、维护及小组管理工作，同时也负责管理物流 iOS 开发组的 GitHub 组织和维护本组的技术博客。",
            "自 2015 年开始接触 iOS 开发，至今已有 2 年时间，熟练掌握 Swift、Objective-C 代码的编写。熟悉大部分 iOS 开发与调试工具，理解 iOS App 结构与运行机制，注重代码质量与执行效率。",
            "了解常见移动 App 架构，长期使用 Swift 与 Objective-C 进行混合开发，熟悉各类常用第三方库的使用。",
            "熟悉 iOS 库的开发与发布，了解怎样利用 CocoaPods／Swift Package Manager／Cathage 进行打包与集成，业余时间热爱编写开源代码。熟悉持续集成，能够编写 Jenkins、Travis CI 等持续集成工具的配置。",
            "熟悉 Git Flow 工作流程，有较好的 Git 使用习惯。有良好的代码风格与清晰的文档结构，遵循团队开发规范。",
            "当前主要学习 Swift 语言，能够开发一定程度的 Android 程序，也会写一些简单的前端页面和 MFC／Qt 桌面端应用。",
            "寻觅一份 iOS 开发的全职正式工作，也可以根据具体情况考虑其它相关岗位。"
            ], strong: [6])
        content.specialities = [
            "Swift": 99,
            "Objective-C": 66,
            "C/C++": 33
        ]
        content.skillsList =  [
            "iOS": 1,
            "Swift": 2,
            "Objective-C": 3,
            "Kotlin/Android": 4,
            "Shell": 5,
            "HTML & CSS": 6,
            "Javascript": 7,
            "C/C++/Qt/VC": 8,
            "Markdown": 9
        ]
        content.skillsDescription = [
            "有良好的代码编写规范",
            "对应用工作机制较熟悉",
            "有良好的程序开发能力",
            "积攒了丰富的调试经验",
            "热衷于用代码解决问题",
            "熟练使用版本控制工具",
            "倾力于开源与技术分享",
            "能够阅读英文技术文档",
            "关注科技行业前沿技术"
        ]
        content.githubID = "EyreFree"
        content.community =  [
            "iOS": "开发、维护和推广 \("GitHub".a(link: "https://github.com/EyreFree")) 上的 iOS 开源库。",
            "翻译": "作为 \("SwiftGG".a(link: "http://swift.gg/")) 翻译组成员，参与翻译组的日常翻译、校对工作；参与饿了么大前端 Node 面试题（\("ElemeFE/node-interview".a(link: "https://github.com/ElemeFE/node-interview"))）中译英工作；提交英译中文档 PR 到 \("SwiftLint".a(link: "https://github.com/realm/SwiftLint")) 等开源项目。",
            "其它": "作为 \("T 沙龙".a(link: "http://t.swift.gg/"))上海组委会成员负责组织上海地区的 iOS 线下技术分享交流活动；管理饿了么物流 iOS 开发组 GitHub 组织并维护小组技术博客。"
        ]
        content.experience = [
            [2: [
                "N 年 iOS 开发经验；",
                "了解移动开发原理；",
                "热衷 iOS 应用开发。"
                ]
            ],
            [3: [
                "M 年 C++ 开发经验；",
                "MFC / Qt / Win32 各种；",
                "熟悉各类开发工具调试的使用。"
                ]
            ]
        ]
        content.setProject(projects: [
            ("上海xxx科技有限公司（2016.12 — 至今）", "iOS 团队开发和小组管理经验：xx商家版，xxx物流 iOS 开发组博客", [
                "从 1.2.0 上架 AppStore 开始参与开发和维护工作至今，主要完成了新模块的开发、部分旧模块的重构、RN 热更新接入、项目 Swift 化等工作；",
                "作为xxx iOS 端小组负责人参与日常技术方案选型、业务迭代排期、线上异常监控、BUG 修复等工作；",
                "维护物流 iOS 开发组 GitHub 组织，同时维护开发组技术博客。"
                ]),
            ("杭州xxx信息科技有限公司（2016.05 — 2016.12）", "iOS 独立开发经验：xxxx-动漫周边代购商城，xxx-表情包", [
                "使用 Swift 2.3 完成整个 App 从无到有的开发、上架以及后续的升级维护工作，基本实现了一个电商 App 功能；",
                "研究 iOS 10 新特性，尝试开发了 iOS 表情包 App 并向公司提出建议，然后上架。"
                ]),
            ("北京xx科技有限公司（2015.03 — 2016.05）", "北京xx科技有限公司（2015.03 — 2016.05）", [
                "从加入公司开始学习 iOS 开发，积累了一定的 iOS 开发和维护经验；",
                "利用 Swift 2.3 独立对原有 App 进行了重构并完成上架。"
                ]),
            ("南京xxx科技有限公司（2014.09 — 2015.01）", "VC 业务迭代和维护经验：xxx高速编程器/烧录器 PC 控制软件，xxx官方网站", [
                "利用 VS 等开发工具维护基于 MFC 的上位机控制软件；",
                "利用 PS 等工具制作公司宣传单和其他材料；",
                "利用 WordPress 搭建公司网站。"
                ])
        ])
        content.setOpenSource(projects: [
            ("示例项目", "EFQRCode（2300+ Star）", "这里可以填写项目介绍，这里可以填写项目介绍，这里可以填写项目介绍，这里可以填写项目介绍，这里可以填写项目介绍，这里可以填写项目介绍，这里可以填写项目介绍，这里可以填写项目介绍，这里可以填写项目介绍。", "https://github.com/EyreFree/EFQRCode")
        ])
        content.interests = [
            "翻译": "fi-pencil",
            "前端": "fi-html5",
            "设计": "fi-paint-bucket",
            "桌面": "fi-folder"
        ]
        return content
    }
}

