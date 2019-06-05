//
//  UsersStore.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct UsersState: StateActions {
    enum Action {
        case addUser
        case deleteUser(index: Int)
        case move(from: Int, to: Int)
        case editUser(id: Int, name: String, username: String)
        case testEditFirstUser
        case startEditUser
        case stopEditUser
    }
    
    var users: [User]
    var isEditingUser = false
    
    init(users: [User] = []) {
        self.users = users
    }
    
    mutating func update(with action: UsersState.Action) {
        switch action {
        case .addUser:
            users.append(User(id: users.count,
                              name: "New user \(users.count + 1)",
                username: "@newuser\(users.count + 1)"))
        case let .deleteUser(index):
            users.remove(at: index)
        case let .move(from, to):
            let user = users.remove(at: from)
            users.insert(user, at: to)
        case let .editUser(id, name, username):
            var user = users[id]
            user.name = name
            user.username = username
            users[id] = user
        case .testEditFirstUser:
            if !users.isEmpty {
                users[0] = User(id: 0, name: "user1", username: "u\ns\ne\nr\nn\na\nm\ne")
            }
        case .startEditUser:
            isEditingUser = true
        case .stopEditUser:
            isEditingUser = false
        }
    }
}
