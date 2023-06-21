//
//  ContentView.swift
//  SwiftUI004
//
//  Created by Jackiossy on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user1 = DataModel.user1
    @State private var content1 = DataModel.content_array.last!

    
    @ViewBuilder var header_view: some View {
        

        HStack {
            Image(user1.headerImage)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(user1.nickname)
                    
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
                VStack(alignment:.leading) {
                    header_view
                    
                    Text(content1.content_text)
                        .padding()
                        .padding(.top, -15)
                    
                    Grid {
                        ForEach(content1.images.indices) { img in
                            GridRow {
                                Image(content1.images[img])
                                    .resizable()
                                    .scaledToFill()
                                    .padding()
                                    .padding(.top,-25)
                            }
                        }
                    }
                    
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
