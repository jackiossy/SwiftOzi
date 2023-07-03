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
    static let news_list = "https://kkjapi.mydrivers.com/api/contents/listv2.ashx?cid=0&istop=0&maxid=0&sign=-261143547&tid=1&udid=5257288900054519417&xaid=cd07d3291ae28a1e75a80b9c5263c7ee9f80f865"
    
    
    static let news_detail = "https://kkjapi.mydrivers.com/api/3/contents/details?sign=-261143547&udid=5257288900054519417&version=2.3.1&xaid=cd07d3291ae28a1e75a80b9c5263c7ee9f80f865&nids="

    //920278

}


struct SWKWebView: UIViewRepresentable {
    
    @Binding var url: String?
    
    func makeUIView(context: Context) -> WKWebView {
        let webview = WKWebView()
        webview.navigationDelegate = context.coordinator
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = url, let requetURL = URL(string: url)  {
            uiView.load(URLRequest(url: requetURL))
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
        
    class Coordinator: NSObject,WKNavigationDelegate {
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.title") { (result, error) in
                print("didFinish:\(String(describing: result ?? ""))")
            }
        }
    }
}
