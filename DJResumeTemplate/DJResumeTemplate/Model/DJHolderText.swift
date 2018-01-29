//
//  DJHolderText.swift
//  DJResumeTemplate
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Foundation

class DJHolderText: DJHolder {

    typealias contentType = String
    var content = ""

    func generate() -> String {
        return content
    }

    func set(_ content: String) {
        self.content = content
    }
}
