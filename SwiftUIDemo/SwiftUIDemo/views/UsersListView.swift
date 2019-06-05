//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI

struct UsersListView : View {
    @ObjectBinding var store = UsersStore()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addUser) {
                        Text("Add user")
                    }
                    Button(action: targetUpdate) {
                        Text("Update first")
                    }
                }
                Section {
                    ForEach(store.users) {user in
                        NavigationButton(destination: UserDetailView(user: user)) {
                            UserRow(user: user)
                        }
                    }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                }
            }
                .listStyle(.grouped)
                .navigationBarTitle(Text("Users (\(store.users.count))"))
                .navigationBarItems(trailing: EditButton())
        }

    }
    
    func addUser() {
        store.users.append(User(id: store.users.count + 1,
                                name: "New user",
                                username: "@newuser"))
    }
    
    func targetUpdate() {
        if !store.users.isEmpty {
            store.users[0] = User(id: 0, name: "user1", username: "u\ns\ne\nr\nn\na\nm\ne")
        }
    }
    
    func delete(at offset: IndexSet) {
        store.users.remove(at: offset.first!)
    }
    
    func move(from: IndexSet, to: Int) {
        let user = store.users.remove(at: from.first!)
        store.users.insert(user, at: to)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        UsersListView(store: UsersStore(users: sampleData))
    }
}
#endif
