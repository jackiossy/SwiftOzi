//
//  NewsDetailViewModel.swift
//  SwiftUITest006
//
//  Created by Jackiossy on 7/3/23.
//

import SwiftUI
import Alamofire

class NewsDetailViewModel: ObservableObject {
    @Published var news_list: [NewsDetailModel] = []
    
    
    func request_detail_data (nid: String) {
//        AF.request(UrlStringList.news_detail+nid).responseDecodable(of: NewsDetailModel.self) { response in
//            debugPrint(response.value)
//        }
        
        AF.request(UrlStringList.news_detail+nid).response { response in
            debugPrint(response.value)
        }
    }
}
