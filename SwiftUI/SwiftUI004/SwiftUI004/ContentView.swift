//
//  ContentView.swift
//  SwiftUI004
//
//  Created by Jackiossy on 6/20/23.
//

import SwiftUI

struct HeaderView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var user1: User

    var body: some View {
        
        HStack {
            Image(user1.headerImage)
                .resizable()
//                .frame(width: 50, height: 50)
                .frame(minWidth: 50,maxWidth: 100, minHeight: 50, maxHeight: 100)
                .cornerRadius(.infinity)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(user1.nickname)
                    
                Text("10 hours ago. Form iPhone 14 Pro")
                    .font(.caption2).foregroundColor(.gray)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "plus")
                Text("关注")
                    .font(.body)
            }
            .buttonStyle(.bordered)
            .background(colorScheme == .dark ? Color.black :Color.white)
            .cornerRadius(20)

            
        }
        .padding()
    }

}

struct ContentView: View {
    
    @State private var c_array = DataModel.content_array
    let img_width = ( UIScreen.main.bounds.width-40)/3
    let single_img_width =  UIScreen.main.bounds.width - 20
//    let single_img_width =  UIScreen.main.bounds.width


    

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    ForEach (c_array) { blog in
                        VStack(alignment:.leading) {
                            HeaderView(user1: blog.user)
                            
                            Text(blog.content_text)
                                .padding()
                                .padding(.top, -15)
                            
                            Grid(horizontalSpacing: 5) {
                                ForEach(0..<getGridRowCount(image_count: blog.images.count), id: \.self) { index in
                                    
                                    GridRow {
                                        ForEach(0..<getRowItemCount(gridrow_count: index, img_count: blog.images.count), id: \.self) { column in
                                            
                                            ZStack {
                                                Image(blog.images[(index*3 + column)])

                                                    .resizable()
                                                    .frame(width: blog.images.count == 1 ? single_img_width:img_width, height: blog.images.count == 1 ? single_img_width:img_width)
                             
                                            }
               
                                        }
                              
                                    }
                                    .padding(.top,-3)
                                }
                            }
                            .padding(.top,-25)

                            .padding()
                            
                            Divider()
                                .padding(.top,-10)

                            HStack() {
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                                    Text("1.2K")
                                }
                                Spacer()

                                Button {
                                    
                                } label: {
                                    
                                    Image(systemName: "ellipsis.message")
                                    Text("23.2K")
                                }
                                Spacer()

                                Button {
                                    
                                } label: {
                                    Image(systemName: "hand.thumbsup")
                                    Text("10W")
                                }
                                Spacer()

                            }
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.top, -5)
                            
                             
                            Rectangle()
                                .fill(Color("spactor"))
                                

                        }

                    }

                }
                
            }
            .navigationTitle("热门")
            


        }

    }
    
    // MARK: get row count
    func getGridRowCount(image_count: Int) ->Int {
        
        let num1 = image_count/3
        let num2 = image_count%3
        
        if num2 == 0 {
            return num1
        }
        return num1+1
        
    }
    
    // MARK: get every row count
    func getRowItemCount(gridrow_count: Int, img_count: Int) -> Int {
        let num1 = img_count/3
        let num2 = img_count%3
        
        if gridrow_count < num1 {
            return 3
        }
        
        return num2
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
