//
//  DJFile.swift
//  DJResumeTemplate
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Foundation

class DJFile {

    var path: String
    var content: String = ""

    init?(path: String) throws {
        self.path = path
        content = try String(contentsOfFile: path, encoding: .utf8)
    }

    func save() throws {
        try content.write(toFile: path, atomically: false, encoding: .utf8)
    }
}
