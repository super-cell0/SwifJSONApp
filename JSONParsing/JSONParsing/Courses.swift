//
//  Courses.swift
//  JSONParsing
//
//  Created by beidixiaoxiong on 2022/3/29.
//

import Foundation

///数据
struct Course: Codable {
    ///标题
    let title: String
    ///服务项
    let service:[String]
    ///价格
    let lessonCount: Int
    
    struct Technology: Codable {
        ///语言
        let lan: String
        ///编辑器
        let editor: String
        ///API
        let framework: String
    }
}
