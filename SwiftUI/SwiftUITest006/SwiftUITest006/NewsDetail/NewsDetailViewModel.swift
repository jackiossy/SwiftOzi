//
//  NewsDetailViewModel.swift
//  SwiftUITest006
//
//  Created by Jackiossy on 7/3/23.
//

import SwiftUI
import Alamofire

class NewsDetailViewModel: ObservableObject {
    
    @Published var news_list :NewsContent = NewsContent(article_content: "")
//    @Published var news_list :NewsContent
    
    func request_detail_data (nid: String) {
        AF.request(UrlStringList.news_detail+nid).responseDecodable(of: NewsDetailModel.self) { response in
            DispatchQueue.main.async {
                self.news_list.article_content = response.value?.data.news.first?.article_content ?? ""
            }
        }
        
//        AF.request(UrlStringList.news_detail+nid).response { response in
//            debugPrint(response.data)
//        }
    }
}
