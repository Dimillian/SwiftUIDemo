//
//  UserDetailView.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI
import Combine

struct UserDetailView : View {
    @EnvironmentObject var usersState: Store<UsersState>
    let userId: Int
    
    var editModal: Modal {
        let user = usersState.state.users[userId]
        return Modal(UserEditForm(userId: user.id, saveHandler: { saved in
            self.usersState.dispatch(action: .stopEditUser)
        }).environmentObject(usersState)) {
            self.usersState.dispatch(action: .stopEditUser)
        }
    }
    
    var body: some View {
        let user = usersState.state.users[userId]
        return VStack {
            Image(systemName: user.imageName)
            Text(user.name)
            Text(user.username).lineLimit(0)
            }
            .navigationBarTitle(Text(user.name), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.usersState.dispatch(action: .startEditUser)
                }) {
                    Text("Edit user")
                    }
                    .presentation(self.usersState.state.isEditingUser ? self.editModal : nil))
    }
}

#if DEBUG
struct UserDetailView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(userId: 0).environmentObject(Store(state: UsersState(users: sampleData)))
        }
    }
}
#endif


