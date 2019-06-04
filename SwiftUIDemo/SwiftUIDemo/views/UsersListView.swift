//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI

struct UsersListView : View {
    @State var store = UsersStore(users: sampleData)
    @State var isEditing = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    if !isEditing {
                        Button(action: addUser) {
                            Text("Add user")
                        }
                    }
                    Button(action: editMode) {
                        Text(isEditing ? "Done" : "Edit")
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
                }
            }
                .listStyle(.grouped)
        }
            .navigationBarTitle(Text("Test"))
            .navigationBarItems(trailing: Text("Add"))
    }
    
    func addUser() {
        store.users.append(User(id: store.users.count + 1,
                                name: "New user",
                                username: "@newuser"))
    }
    
    func editMode() {
        isEditing.toggle()
    }
    
    
    func targetUpdate() {
        store.users[0] = User(id: 0, name: "user1", username: "u\ns\ne\nr\nn\na\nm\ne")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        UsersListView(store: UsersStore(users: sampleData))
    }
}
#endif
