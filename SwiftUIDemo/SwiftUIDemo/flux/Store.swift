//
//  Store.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 05/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI
import Combine

public protocol StateActions {
    associatedtype Action
    
    mutating func update(with action: Action)
}

public final class Store<StateType>: BindableObject where StateType: StateActions {
    
    private(set) public var state: StateType {
        didSet {
            didChange.send(state)
        }
    }
    
    public let didChange = PassthroughSubject<StateType, Never>()
    
    public init(state: StateType) {
        self.state = state
    }
    
    public func dispatch(action: StateType.Action) {
        var newState = state
        newState.update(with: action)
        state = newState
    }
    
}
