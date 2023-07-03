//
//  NetworkManager.swift
//  SwiftUITest006
//
//  Created by Jackiossy on 6/29/23.
//

import Foundation
import Alamofire






class NewsViewModel: ObservableObject {
    @Published var news_list: [NewsItemModel] = []
    func request_news_list () {
        AF.request(UrlStringList.news_list).responseDecodable(of: NewsListModel.self) { response in
            for item in response.value?.data ?? [] {
                
                print(item.title)
            }
            DispatchQueue.main.async {
                self.news_list = response.value?.data ?? []
            }

        }
    }
}
