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

struct BlogContent: Equatable, Hashable {
    var id: String
    var user: User
    var content_text: String
    var images: [String]
    var nice_count: Int
    var replay_count: Int
}

class DataModel {
    static let user1 = User.init(id: UUID().uuidString, nickname: "Jackiossy", headerImage: "header1", des: "苹果开发者")
    static let user2 = User.init(id: UUID().uuidString, nickname: "Jackiossy", headerImage: "header2", des: "苹果开发者")
    static let user3 = User.init(id: UUID().uuidString, nickname: "Jackiossy", headerImage: "header3", des: "苹果开发者")

    static let content_array = [
        BlogContent.init(id: UUID().uuidString, user: user1, content_text: "心灵鸡汤", images: ["c1_1"], nice_count: 10, replay_count: 10),
        BlogContent.init(id: UUID().uuidString, user: user2, content_text: "心灵鸡汤", images: ["c2_1","c2_2","c2_3"], nice_count: 10, replay_count: 10)
    ]
}
