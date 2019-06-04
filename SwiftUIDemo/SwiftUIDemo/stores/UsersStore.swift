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

final class UsersStore: BindableObject {
    var users: [User] {
        didSet {
            didChange.send(self.users)
        }
    }
    
    init(users: [User]) {
        self.users = users
    }
    
    
    let didChange = PassthroughSubject<[User], Never>()
}
