//
//  DJHolder.swift
//  DJResumeTemplate
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Foundation

class DJHolder {

    var holder: String

    init(_ text: String) {
        holder = "%\(text)%"
    }

    func generate() -> String {
        fatalError("Must override")
    }

    func apply(_ templete: inout String) {
        templete = templete.replace(holder, with: generate())
    }
}
