//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI

struct UsersListView : View {
    @EnvironmentObject var usersState: Store<UsersState>
    
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
                    ForEach(usersState.state.users) {user in
                        NavigationButton(destination: UserDetailView(userId: user.id).environmentObject(self.usersState)) {
                            UserRow(user: user)
                        }
                    }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                }
            }
                .listStyle(.grouped)
                .navigationBarTitle(Text("Users (\(usersState.state.users.count))"))
                .navigationBarItems(trailing: EditButton())
        }

    }
    
    func addUser() {
        usersState.dispatch(action: .addUser)

    }
    
    func targetUpdate() {
        usersState.dispatch(action: .testEditFirstUser)
    }
    
    func delete(at offset: IndexSet) {
        usersState.dispatch(action: .deleteUser(index: offset.first!))
    }
    
    func move(from: IndexSet, to: Int) {
        usersState.dispatch(action: .move(from: from.first!, to: to))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        UsersListView().environmentObject(Store(state: UsersState(users: sampleData)))
    }
}
#endif
