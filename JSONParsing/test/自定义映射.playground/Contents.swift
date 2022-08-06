import UIKit

let courseJSON = """
{
     "id": 1,
     "title": "iOS开发",
     "url": "https://www.apple.com",
     "level": "初级",
     "technology": {
     "lan": "swift",
     "editor": "Xcode",
     "framework": "UIKit"
     },
     "service": ["终身报价", "永久更新"],
     "lesson_count": 199
}
"""
let courseJSONData = courseJSON.data(using: .utf8)!

struct Course: Codable {
    //let id: Int
    let title: String
    let webURL: URL
    let level: Level
    let technology: Technology
    let service:[String]
    let lessonCount: Int
    //let createTime = Date()
    //var createTime: Date?
    //var createTime = Date()
    var createTime: Date {
        Date()
    }
    
    enum Level: String, Codable {
        case 初级
        case 中级
        case 高级
    }
    
    struct Technology: Codable {
        let lan: String
        let editor: String
        let framework: String
    }
}

extension Course {
    enum CodingKeys: String, CodingKey {
        case title, level, technology, service
        case webURL = "url"
        case lessonCount = "lesson_count"
    }
 
}

do {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let course = try JSONDecoder().decode(Course.self, from: courseJSONData)
    print(course.title)
} catch {
    print(error)
}
