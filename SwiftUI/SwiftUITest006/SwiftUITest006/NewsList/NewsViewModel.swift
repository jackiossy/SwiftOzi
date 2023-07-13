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
    
    //传递page页码
    func request_news_list (page: Int) {
        AF.request(UrlStringList.news_list+"\(page)").responseDecodable(of: NewsListModel.self) { response in
            for item in response.value?.data ?? [] {
                print("********************* This is page \(page) data.************************")
                print(item.title)
            }
            DispatchQueue.main.async {
                if page != 1 {
                    self.news_list += response.value?.data ?? []
                }else {
                    self.news_list = response.value?.data ?? []
                }
            }

        }
    }
}
