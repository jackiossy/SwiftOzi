//
//  DataModel.swift
//  SwiftUI004
//
//  Created by Jackiossy on 6/20/23.
//

import SwiftUI

struct User: Equatable, Hashable {
    var id: String
    var nickname: String
    var headerImage: String
    var des: String
}

struct BlogContent: Identifiable, Hashable {
    var id: String
    var user: User
    var content_text: String
    var images: [String]
    var nice_count: Int
    var replay_count: Int
}

class DataModel {
    static let user1 = User.init(id: UUID().uuidString, nickname: "Rogers", headerImage: "header5", des: "Apple Dev.")
    static let user2 = User.init(id: UUID().uuidString, nickname: "Cyber Punk", headerImage: "header2", des: "苹果开发者")
    static let user3 = User.init(id: UUID().uuidString, nickname: "Eric Lockley", headerImage: "header3", des: "苹果开发者")
    static let user4 = User.init(id: UUID().uuidString, nickname: "東山くるみ", headerImage: "header4", des: "苹果开发者")
    static let user5 = User.init(id: UUID().uuidString, nickname: "spécial", headerImage: "header5", des: "苹果开发者")

    static let content_array = [
        BlogContent.init(id: UUID().uuidString, user: user1, content_text: "那叫一个地地道道~ 迪迪豆豆~", images:  ["c5_1","c5_2","c5_3","c5_4"], nice_count: 10, replay_count: 10),

        BlogContent.init(id: UUID().uuidString, user: user2, content_text: "使用小米13Utral拍摄的一些样张", images: ["c2_1","c2_2","c2_3","c2_4","c2_5"], nice_count: 10, replay_count: 10),
        
        BlogContent.init(id: UUID().uuidString, user: user3, content_text: "给厨子发邮件问下", images: ["c3_1","c3_2","c3_3","c3_4","c3_5","c3_6","c3_7","c3_8","c3_9"], nice_count: 10, replay_count: 10),
        BlogContent.init(id: UUID().uuidString, user: user4, content_text: "使用小米13Utral拍摄的一些样张", images: ["c4_1","c4_2","c4_3"], nice_count: 10, replay_count: 10),
        BlogContent.init(id: UUID().uuidString, user: user5, content_text: "使用小米13Utral拍摄的一些样张", images: ["c5_1","c5_2","c5_3","c5_4"], nice_count: 10, replay_count: 10)



    ]
}
