 //
 //  UserEditForm.swift
 //  SwiftUIDemo
 //
 //  Created by Thomas Ricouard on 05/06/2019.
 //  Copyright © 2019 Thomas Ricouarf. All rights reserved.
 //
 
 import SwiftUI
 
 struct UserEditForm : View {
    var user: User
    
    @State var newUserName = ""
    @State var newUserUsername = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text("User name")
                TextField($newUserName)
                    .textFieldStyle(.roundedBorder)
                Divider()
                Text("Username")
                TextField($newUserUsername)
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
    
    func save() {
        
    }
    
    func close() {
        
    }
 }
 
 #if DEBUG
 struct UserEditForm_Previews : PreviewProvider {
    static var previews: some View {
        UserEditForm(user: sampleData[0])
    }
 }
 #endif

