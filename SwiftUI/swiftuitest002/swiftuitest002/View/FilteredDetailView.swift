//
//  FilteredDetailView.swift
//  swiftuitest002
//
//  Created by jackiossy on 6/17/22.
//

import SwiftUI

struct FilteredDetailView: View {
    @EnvironmentObject var expenseViewModle : ExpenseViewModel
    // MARK: Evironment Value
    @Environment(\.self) var env
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    // MARK: Back Button
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.backward.circle.fill")
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

                    
                    Text("Transactions")
                        .font(.title.bold())
                        .opacity(0.7)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
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
                .padding()
            }
        }
        .navigationBarHidden(true)
        .background {
            Color("BG")
                .ignoresSafeArea()
        }
    }
}

struct FilteredDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
