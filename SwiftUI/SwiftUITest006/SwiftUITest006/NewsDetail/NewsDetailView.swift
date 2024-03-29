//
//  NewsDetailView.swift
//  SwiftUITest006
//
//  Created by Jackiossy on 7/3/23.
//

import SwiftUI
import WebKit

struct NewsDetailView: View {
    @Binding var nid: String
    @Binding var title: String 

    
    
    @StateObject var news_detailVM = NewsDetailViewModel()
    @Environment(\.presentationMode) private var presentationMod
    

    var body: some View {
        NavigationStack {
            VStack {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal,10)
                
                HTMLView(htmlString: "<html><head><meta name=\"viewport\"  content=\"width=device-width, initial-scale=1, maximum-scale=1\"/><style>img {width:auto;height:auto;max-width:100%;max-height:90vh;}</style></head><body><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0,PingFangSC-Regular\">\(news_detailVM.news_list.article_content)</body></html>")
                
                HStack {
                    Button {
                        presentationMod.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.largeTitle)
                    }
                    .buttonStyle(.automatic)
                    
                    Button {
                        presentationMod.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.largeTitle)
                    }
                }
                


            }
        }
   
     
        .task {
            news_detailVM.request_detail_data(nid: nid)
        }
    }
}

struct HTMLView: UIViewRepresentable {
    var htmlString: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }

}


// 
