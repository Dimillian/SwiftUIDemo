//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI

struct UsersListView : View {
    @ObjectBinding var usersStore: UsersStore
    
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
                    ForEach(usersStore.users) {user in
                        NavigationButton(destination: UserDetailView(usersStore: store.usersStore, userId: user.id)) {
                            UserRow(user: user)
                        }
                    }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                }
            }
                .listStyle(.grouped)
                .navigationBarTitle(Text("Users (\(usersStore.users.count))"))
                .navigationBarItems(trailing: EditButton())
        }

    }
    
    func addUser() {
        usersStore.addUser()
    }
    
    func targetUpdate() {
        if !usersStore.users.isEmpty {
            usersStore.users[0] = User(id: 0, name: "user1", username: "u\ns\ne\nr\nn\na\nm\ne")
        }
    }
    
    func delete(at offset: IndexSet) {
        usersStore.delete(at: offset.first!)
    }
    
    func move(from: IndexSet, to: Int) {
        usersStore.move(from: from.first!, to: to)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        UsersListView(usersStore: UsersStore(users: sampleData))
    }
}
#endif
