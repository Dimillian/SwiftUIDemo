 //
 //  UserEditForm.swift
 //  SwiftUIDemo
 //
 //  Created by Thomas Ricouard on 05/06/2019.
 //  Copyright © 2019 Thomas Ricouarf. All rights reserved.
 //
 
 import SwiftUI
 
 struct UserEditForm : View {
    @EnvironmentObject var state: AppState
    
    let userId: Int
    let saveHandler: ((Bool) -> Swift.Void)?
    
    @State var newUserName = ""
    @State var newUserUsername = ""
    @State var showSaved = false
    
    var savedAnimation: Animation {
        Animation
            .spring(initialVelocity: 5)
            .speed(2)
    }
    
    var body: some View {
        let user = state.usersState.users[userId]
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
                    .padding(8)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(8)
                }
                .navigationBarItems(trailing: Button(action: close) {
                    Text("Close")
                })
                .navigationBarTitle(Text("Edit \(user.name)"), displayMode: .inline)
            
            Text("Saved successfully")
                .color(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
                .scaleEffect(showSaved ? 1: 0.5)
                .opacity(showSaved ? 1 : 0)
                .animation(savedAnimation)
        }
    }
    
    func save() {
        withAnimation {
            showSaved = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showSaved = false
        }
        
        state.dispatch(action: UserActions.editUser(id: userId, name: newUserName, username: newUserUsername))
        saveHandler?(true)
    }
    
    func close() {
        saveHandler?(false)
    }
 }
 
 #if DEBUG
 struct UserEditForm_Previews : PreviewProvider {
    static var previews: some View {
        UserEditForm(userId: 0, saveHandler: nil).environmentObject(AppState(usersState: UsersState(users: sampleData)))
    }
 }
 #endif
 
 

