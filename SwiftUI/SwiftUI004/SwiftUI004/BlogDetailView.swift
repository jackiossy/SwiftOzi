//
//  BlogDetailView.swift
//  SwiftUI004
//
//  Created by jackiossy on 2023/6/27.
//

import SwiftUI

struct BlogDetailView: View {
    
    var blog_id: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        VStack(alignment: .leading) {
            Text("This is blog detail view.")
                .font(.largeTitle)
                .bold()
            
            Text("blog_ID:\(blog_id)")
                .font(.caption2)
                .bold()
                .foregroundColor(.secondary)
        }
        
        .customNaviBack(presentationMode: presentationMode)

        
        
    }
}

extension View {
    func customNaviBack(presentationMode: Binding<PresentationMode>) -> some View{
        VStack{
            
        }
        // hidden navigationBar button
        .navigationBarBackButtonHidden(true)
        // custom navigationBar back Button
        .navigationBarItems(leading: Button(action: { //自定义导航的返回按钮
                presentationMode.wrappedValue.dismiss() //返回上级页面
            }, label: {
                Image(systemName: "chevron.backward.circle")
            }))
    }
}

struct BlogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BlogDetailView()
    }
}
