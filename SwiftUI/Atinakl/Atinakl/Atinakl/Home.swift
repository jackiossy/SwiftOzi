//
//  Home.swift
//  Atinakl
//
//  Created by Jackiossy on 2022/4/9.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Text("Characters")
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Chracters")
                }
            
            Text("Comics")
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                    Text("Comics")
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
