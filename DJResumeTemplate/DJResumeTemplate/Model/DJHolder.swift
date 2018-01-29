//
//  DJHolder.swift
//  DJResumeTemplate
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Foundation

protocol DJHolerProtocol {
    associatedtype contentType
    func generate() -> String
    func set(_ content: contentType)
    func apply(_ templete: inout String)
}

extension DJHolerProtocol {
    func generate() -> String {
        return ""
    }
    func set(_ content: contentType) {
        print("set content!")
    }
}

class DJHolder: DJHolerProtocol {
    typealias contentType = Any
    var holder: String

    init(_ text: String) {
        holder = "%\(text)%"
    }

    func apply(_ templete: inout String) {
        templete = templete.replace(holder, with: generate())
    }
}
