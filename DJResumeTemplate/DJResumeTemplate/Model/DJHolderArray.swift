//
//  DJHolderArrar.swift
//  DJResumeTemplate
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Foundation

class DJHolderArray: DJHolder {

    typealias contentType = Array<Any>
    var array: Array<Any> = []
    var processor: ((Array<Any>) -> String)?


    init(_ text: String, _ processor: @escaping (Array<Any>) -> String) {
        super.init(text)
        self.processor = processor
    }

    private override init(_ text: String) {
        fatalError("This method should not be called!")
    }

    func generate() -> String {
        return processor?(array) ?? ""
    }

    func set(_ content: Array<Any>) {
        array = content
    }
}
