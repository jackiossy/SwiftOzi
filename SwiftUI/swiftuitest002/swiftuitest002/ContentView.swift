//
//  ContentView.swift
//  swiftuitest002
//
//  Created by jackiossy on 6/15/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
