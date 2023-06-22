//
//  ContentView.swift
//  SwiftUI004
//
//  Created by Jackiossy on 6/20/23.
//

import SwiftUI

struct HeaderView: View {
    var user1: User

    var body: some View {
        
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

}

struct ContentView: View {
    
    @State private var c_array = DataModel.content_array
    let img_width = ( UIScreen.main.bounds.width-40)/3
    let single_img_width =  UIScreen.main.bounds.width - 20


    

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    ForEach (0..<c_array.count) { c_index in
                        VStack(alignment:.leading) {
                            HeaderView(user1:c_array[c_index].user)
                            
                            Text(c_array[c_index].content_text)
                                .padding()
                                .padding(.top, -15)
                            
                            Grid(horizontalSpacing: 5) {
                                ForEach(0..<getGridRowCount(image_count: c_array[c_index].images.count)) { index in
                                    
                                    GridRow {
                                        ForEach(0..<getRowItemCount(gridrow_count: index, img_count: c_array[c_index].images.count)) { column in
                                            
                                            ZStack {
                                                Image(c_array[c_index].images[(index*3 + column)])

                                                    .resizable() //可调整大小
                                               
                                                    .frame(width: c_array[c_index].images.count == 1 ? single_img_width:img_width, height: c_array[c_index].images.count == 1 ? single_img_width:img_width)
                             
                                            }
               
        //                                        .padding()
                                        }
                              
                                    }
                                    .padding(.top,-3)
                                }
                            }
                            .padding(.top,-25)

                            .padding()
                            
                            Divider()
                            
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
