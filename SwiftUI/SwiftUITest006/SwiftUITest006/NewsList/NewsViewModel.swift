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
    
    @Published var page = 1
    
    //传递page页码
    func request_news_list () {
        let url_string = UrlStringList.news_list+"\(page)"
        print("requesting url: \(url_string)")
        AF.request(url_string).responseDecodable(of: NewsListModel.self) { response in
            for item in response.value?.data ?? [] {
                print("********************* This is page \(self.page) data.************************")
                print(item.title)
            }
            
            let oldData = self.news_list
            
            DispatchQueue.main.async {
                
                self.news_list = oldData + response.value!.data
                self.page += 1

            }

        }
    }
}
