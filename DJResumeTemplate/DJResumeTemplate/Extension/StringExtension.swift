//
//  StringExtension.swift
//  DJResumeTemplate
//
//  Created by modao on 2018/1/29.
//  Copyright © 2018年 MockingBot. All rights reserved.
//

import Foundation

extension String {

    /// [] 操作符重载
    subscript(index: Int) -> Character {
        return self[self.index(startIndex, offsetBy: index)]
    }

    /// 是否符合输入的正则表达式
    func conform(regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }

    /// 子串数量
    func occurrencesOf(subString: String) -> Int {
        return self.components(separatedBy: subString).count - 1
    }

    /// 替换某个子字符串为另一字符串
    func replace(_ string: String, with: String, options: CompareOptions? = nil) -> String {
        if let options = options {
            return self.replacingOccurrences(of: string, with: with, options: options, range: nil)
        }
        return self.replacingOccurrences(of: string, with: with)
    }

    /// 替换前缀
    func replacePrefix(string: String, with: String) -> String {
        if self.hasPrefix(string) {
            return with + dropFirst(string.count)
        }
        return self
    }

    /// 替换尾缀
    func replaceSuffix(string: String, with: String) -> String {
        if self.hasSuffix(string) {
            return dropLast(string.count) + with
        }
        return self
    }

    /// 移除某个子串
    func remove(string: String) -> String {
        return self.replace(string, with: "")
    }

    /// 移除某个前缀
    func removePrefix(string: String) -> String {
        return self.replacePrefix(string: string, with: "")
    }

    /// 移除某个尾缀
    func removeSuffix(string: String) -> String {
        return self.replaceSuffix(string: string, with: "")
    }

    /// 将多个连续重复字符变为一个
    func toOne() -> String {
        var outString = self
        for index in (1 ..< count).reversed() {
            if outString[index] == outString[index - 1] {
                outString.remove(at: outString.index(outString.startIndex, offsetBy: index))
            }
        }
        return outString
    }

    /// 清除字符串左右空格和换行
    func clean() -> String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    // MARK:- HTML
    /// 添加超链接
    func a(link: String) -> String {
        return "<a href='\(link)'>\(self)</a>"
    }

    /// 添加 Strong
    func strong() -> String {
        return "<strong>\(self)</strong>"
    }

    /// 添加 P
    func p() -> String {
        return "<p>\(self)</p>"
    }

    /// 添加 Div
    func div() -> String {
        return "<div>\(self)</div>"
    }
}
