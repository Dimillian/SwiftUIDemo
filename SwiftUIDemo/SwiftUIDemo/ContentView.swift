//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var store = UsersStore(users: sampleData)
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addUser) {
                        Text("Add user")
                    }
                }
                Section {
                    ForEach(store.users) {user in
                        UserRow(user: user)
                    }
                }
            }
        }.navigationBarTitle(Text("Test"))
        .navigationBarItems(trailing: Text("Add"))
    }
    
    func addUser() {
        store.users.append(User(id: store.users.count + 1,
                                name: "New user",
                                username: "@newuser"))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(store: UsersStore(users: sampleData))
    }
}
#endif
