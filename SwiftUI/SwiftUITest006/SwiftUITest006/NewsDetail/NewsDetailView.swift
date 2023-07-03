//
//  NewsDetailView.swift
//  SwiftUITest006
//
//  Created by Jackiossy on 7/3/23.
//

import SwiftUI

struct NewsDetailView: View {
    var nid = ""
    
    @StateObject var news_detailVM = NewsDetailViewModel()
    var body: some View {
//        SWKWebView(url: $url)
        VStack {
            Text("This is detail view." + nid)
        }
        .task {
            news_detailVM.request_detail_data(nid: nid)
        }
    }
}




struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView()
    }
}
