//
//  Courses.swift
//  JSONParsing
//
//  Created by beidixiaoxiong on 2022/3/29.
//

import Foundation

struct Course: Codable {
    let title: String
    let service:[String]
    let lessonCount: Int
    
    struct Technology: Codable {
        let lan: String
        let editor: String
        let framework: String
    }
}
