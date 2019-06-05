 //
 //  UserEditForm.swift
 //  SwiftUIDemo
 //
 //  Created by Thomas Ricouard on 05/06/2019.
 //  Copyright © 2019 Thomas Ricouarf. All rights reserved.
 //
 
 import SwiftUI
 
 struct UserEditForm : View {
    @ObjectBinding var usersStore: UsersStore
    let userId: Int
    
    @State var newUserName = ""
    @State var newUserUsername = ""
    
    var body: some View {
        get {
            let user = usersStore.users[userId]
            return NavigationView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("User name")
                    TextField($newUserName, placeholder: Text("New name"))
                        .textFieldStyle(.roundedBorder)
                    Divider()
                    Text("Username")
                    TextField($newUserUsername, placeholder: Text("New username"))
                        .textFieldStyle(.roundedBorder)
                    }.padding(16)
                Button(action: save) {
                    Text("Save")
                    }
                    .navigationBarItems(trailing: Button(action: close) {
                        Text("Close")
                    })
                    .navigationBarTitle(Text("Edit \(user.name)"), displayMode: .inline)
            }
        }
    }
    
    func save() {
        usersStore.editUser(id: userId, name: newUserName, username: newUserUsername)
    }
    
    func close() {
        
    }
 }
 
 #if DEBUG
 struct UserEditForm_Previews : PreviewProvider {
    static var previews: some View {
        UserEditForm(usersStore: UsersStore(users: sampleData), userId: 0)
    }
 }
 #endif
 

