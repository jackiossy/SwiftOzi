//
//  UserInfoScreen.swift
//  SwiftUI004
//
//  Created by jackiossy on 2023/6/27.
//

import SwiftUI

struct UserInfoScreen: View {
    
    var userID: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("User Info Screen.")
                .font(.largeTitle)
                .bold()
            
            Text("userID:\(userID)")
                .font(.caption)
                .foregroundColor(.gray)
                .bold()
                
        }
        .padding()

        .navigationBarItems(leading: Button(action: { //自定义导航的返回按钮
                presentationMode.wrappedValue.dismiss() //返回上级页面
            }, label: {
                Image(systemName: "chevron.backward.circle")
            }))
        
    }
}

struct UserInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoScreen()
    }
}
