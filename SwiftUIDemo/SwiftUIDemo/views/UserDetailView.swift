//
//  UserDetailView.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI

struct UserDetailView : View {
    @EnvironmentObject var usersStore: UsersStore
    let userId: Int
    
    @State var showEditModal = false
    
    var editModal: Modal {
        let user = usersStore.users[userId]
        return Modal(UserEditForm(userId: user.id, saveHandler: {nsaved in
            self.showEditModal = false
        }).environmentObject(usersStore)) {
            self.showEditModal = false
        }
    }
    
    var body: some View {
        let user = usersStore.users[userId]
        return VStack {
            Image(systemName: user.imageName)
            Text(user.name)
            Text(user.username).lineLimit(0)
            }
            .navigationBarTitle(Text(user.name), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showEditModal = true
                }) {
                    Text("Edit user")
                    }
                    .presentation(self.showEditModal ? self.editModal : nil))
    }
}

#if DEBUG
struct UserDetailView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(userId: 0).environmentObject(UsersStore(users: sampleData))
        }
    }
}
#endif


