//
//  DJPath.swift
//  DJResumeTemplate
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Foundation

struct DJPath {
    // 资源Bundle
    private static var resourceBundle: Bundle? =  {
        guard let path = Bundle.main.path(forResource: "TemplateBundle", ofType: "bundle") else {
            return nil
        }
        let bundle = Bundle(path: path)
        bundle?.load()
        return bundle
    }()

    // 程序执行路径
    static var base = FileManager.default.currentDirectoryPath

    // 模版文件路径
    static var templete: String {
        get {
            return resourceBundle?.path(forResource: "template", ofType: "html") ?? ""
        }
    }
}
