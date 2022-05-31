//
//  ContentView.swift
//  SwiftUIApp001
//
//  Created by jackiossy on 5/31/22.
//

import SwiftUI

struct ContentView: View {
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    @State var users: [User] = []
    
    var body: some View {
        
        NavigationView {
            List(users){ user in
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.name)
                    Text(user.email)
                        .font(.caption)
                }
            }
            // adding refresh control...
            // Indicator will show until async task finished...
            .refreshable(action: {
                
            })
            .navigationTitle("Pull to Refresh")
        }
        
    }
    
    // Fetching user in async...
    func fetchUsers()async {
        let session = URLSession(configuration: .default)
        do {
            let task = try await session.data(from: url)
            // Decoding...
            let users = try JSONDecoder().decode([User].self, from: task.0)
            self.users = users
        }
        catch{
            print("error")
        }
    }
}


struct User:Identifiable,Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
