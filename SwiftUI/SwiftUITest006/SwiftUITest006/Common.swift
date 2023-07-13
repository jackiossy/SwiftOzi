//
//  Common.swift
//  SwiftUITest006
//
//  Created by Jackiossy on 7/3/23.
//

import Foundation
import WebKit
import SwiftUI


struct UrlStringList {
    static let news_list = "https://kkjapi.mydrivers.com/api/contents/listv2.ashx?cid=0&istop=0&maxid=0&sign=-261143547&udid=5257288900054519417&xaid=cd07d3291ae28a1e75a80b9c5263c7ee9f80f865&tid="
    
    
    static let news_detail = "https://kkjapi.mydrivers.com/api/3/contents/details?sign=-261143547&udid=5257288900054519417&version=2.3.1&xaid=cd07d3291ae28a1e75a80b9c5263c7ee9f80f865&nids="

    //920278

}


struct  WebView : UIViewRepresentable {
    
    let screenW:CGFloat = UIScreen.main.bounds.width
    let screenH:CGFloat = UIScreen.main.bounds.width
    
    var url : String
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        
        let view = WKWebView()
        
        view.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: screenW, height: screenH))

        view.loadHTMLString("<html><head><meta name=\"viewport\"  content=\"width=device-width, initial-scale=1, maximum-scale=1\"/><style>img {width:auto;height:auto;max-width:100%;max-height:90vh;}</style></head><body><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0,Proxima Nova-Regular\">\(url)</body></html>", baseURL: nil)
 
        return view
        
    }
    


    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }

}
