import UIKit

let coursesJSON = """
[
    {
        "id": 1,
        "title": "iOS开发-零基础版",
        "url": "https://www.cctalk.com/m/group/86306378",
        "level": "初级",
        "technology": {
            "lan": "Swift",
            "editor": "Xcode",
            "framework": "UIKit"
        },
        "service": ["终生保价", "永久更新"],
        "lessonCount": 199
    },
    {
        "id": 2,
        "title": "iOS开发-进阶版",
        "url": "https://www.cctalk.com/m/group/86308246",
        "level": "中级",
        "technology": {
            "lan": "Swift",
            "editor": "Xcode",
            "framework": "UIKit"
        },
        "service": ["终生保价", "永久更新"],
        "lessonCount": 220
    },
    {
        "id": 3,
        "title": "iOS开发-SwiftUI",
        "url": "https://www.cctalk.com/m/group/86559266",
        "level": "中级",
        "technology": {
            "lan": "Swift",
            "editor": "Xcode",
            "framework": "SwiftUI"
        },
        "service": ["终生保价", "永久更新"],
        "lessonCount": 155
    },
    {
        "id": 4,
        "title": "iOS开发-通知与推送",
        "url": "https://www.cctalk.com/m/group/87277429",
        "level": "中级",
        "technology": {
            "lan": "Swift",
            "editor": "Xcode",
            "framework": "UIKit"
        },
        "service": ["终生保价", "不定期更新"],
        "lessonCount": 59
    },
    {
        "id": 5,
        "title": "iOS开发-仿小红书实战课",
        "url": "https://www.cctalk.com/m/group/89152816",
        "level": "高级",
        "technology": {
            "lan": "Swift",
            "editor": "Xcode",
            "framework": "UIKit"
        },
        "service": ["终生保价", "永久更新"],
        "lessonCount": 465
    }
]
"""

let courseJSONData = coursesJSON.data(using: .utf8)!

struct Course: Codable {
    //let id: Int
    let title: String
    let url: URL
    let level: Level
    let technology: Technology
    let service:[String]
    let lessonCount: Int
    
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

do {
    let courses = try JSONDecoder().decode([Course].self, from: courseJSONData)
    print(courses.count)
} catch {
    print(error)
}
