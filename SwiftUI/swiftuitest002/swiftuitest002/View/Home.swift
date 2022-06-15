//
//  Home.swift
//  swiftuitest002
//
//  Created by jackiossy on 6/15/22.
//

import SwiftUI

struct Home: View {
    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                HStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Welcome")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Text("iJustines")
                            .font(.title2.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button{
                        
                    } label: {
                        Image(systemName: "hexagon.fill")
                            .foregroundColor(.gray)
                            .overlay(content: {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .padding(7)
                            })
                            .frame(width: 40, height: 40)
                            .background(Color.white,in:RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                }
            }
            .padding()
        }
        .background{
            Color("BG")
                .ignoresSafeArea()
        }
    }
    
    // Mark: Expense Card View...
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
