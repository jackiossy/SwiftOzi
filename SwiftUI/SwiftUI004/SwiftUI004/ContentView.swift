//
//  ContentView.swift
//  SwiftUI004
//
//  Created by Jackiossy on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @ViewBuilder var header_view: some View {
        HStack {
            Image("header1")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("燃烧的大鹅")
                    
                Text("10 hours ago. Form iPhone 14 Pro")
                    .font(.caption2).foregroundColor(.gray)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "plus")
                Text("follow")
            }.buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    header_view
                    
                    Text("往往人心里的矛盾就会是你人生路上的阻碍，如果你想赢，而你心里的自我暗示会认为自己不会赢，那么你认为你赢的几率有多大？如果你认为你自己与众不同，那么你的心态会使你在人生路上走的不会犹豫。")
                }
                
            }
            .navigationTitle("推荐")

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
