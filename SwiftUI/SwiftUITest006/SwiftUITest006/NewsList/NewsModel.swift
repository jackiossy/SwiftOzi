//
//  NewsModel.swift
//  SwiftUITest006
//
//  Created by Jackiossy on 7/3/23.
//

import Foundation

extension NewsViewModel {
    struct NewsListModel: Decodable, Hashable {
        var code: Int
        var msg: String
        var data: [NewsItemModel]
    }


    struct NewsItemModel: Decodable, Hashable {
        var article_id:         Int
        var article_type:       Int
        var title:              String
        var title_long:         String
        var source:             String
        var review_count:       Int
        var editor:             String
        var imgs:               String
    }
}
