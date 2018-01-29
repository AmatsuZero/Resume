//
//  DJHolderMap.swift
//  DJResumeTemplate
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Foundation

class DJHolderMap: DJHolder {

    typealias contentType = Dictionary<String, Any>
    var dictionary: Dictionary<String, Any> = [:]
    var processor: ((Dictionary<String, Any>) -> String)?

    init(_ text: String, _ processor: @escaping (Dictionary<String, Any>) -> String) {
        super.init(text)
        self.processor = processor
    }

    private override init(_ text: String) {
        fatalError("This method should not be called!")
    }

    func generate() -> String {
        return processor?(dictionary) ?? ""
    }

    func set(_ content: Dictionary<String, Any>) {
        dictionary = content
    }
}
