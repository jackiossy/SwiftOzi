//
//  ContentView.swift
//  SwiftUITest006
//
//  Created by Jackiossy on 6/29/23.
//

import SwiftUI
import SDWebImageSwiftUI


struct NewsListScreen: View {
    
    @StateObject var viewmodel = NewsViewModel()
    
    @State var isSheetDetail: Bool = false
    @State var tap_newsid: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewmodel.news_list, id: \.self) { item in
                     HStack {
                        WebImage(url: URL(string: item.imgs))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120,height: 80)
                            .cornerRadius(5)
                        Text(item.title)
                            .font(.callout)
                            .bold()

                    }

                        .onTapGesture {
                            print(item.article_id)
                            tap_newsid = ("\(item.article_id)")
                            isSheetDetail = true

                        }
                }
            }
            .navigationTitle("Esimo News")
 

        }
        .task {
            viewmodel.request_news_list()
        }
        .sheet(isPresented: $isSheetDetail) {
            NewsDetailView(nid: $tap_newsid)
        }
    }
}

extension NewsListScreen {
    func loadNewsList() {
        viewmodel.request_news_list()
    }
}

struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreen()
    }
}
