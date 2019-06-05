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

class UsersStore: BindableObject {
    var users: [User] {
        didSet {
            didChange.send(users)
        }
    }
    
    let didChange = PassthroughSubject<[User], Never>()
    
    init(users: [User] = []) {
        self.users = users
    }
    
    func addUser() {
        users.append(User(id: users.count,
                          name: "New user \(users.count + 1)",
                        username: "@newuser\(users.count + 1)"))
    }
    
    func delete(at index: Int) {
        users.remove(at: index)
    }
    
    func move(from: Int, to: Int) {
        let user = users.remove(at: from)
        users.insert(user, at: to)
    }
    
    func editUser(id: Int, name: String, username: String) {
        var user = users[id]
        user.name = name
        user.username = username
        users[id] = user
    }
}
