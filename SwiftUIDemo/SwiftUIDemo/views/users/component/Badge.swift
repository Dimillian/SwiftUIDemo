//
//  GreenBadge.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 06/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI

struct Badge : View {
    let text: String
    let color: Color
    @Binding var show: Bool
    
    var animation: Animation {
        Animation
            .spring(initialVelocity: 5)
            .speed(2)
    }
    
    var body: some View {
        Text(text)
            .color(.white)
            .padding()
            .background(color)
            .cornerRadius(8)
            .scaleEffect(show ? 1: 0.5)
            .opacity(show ? 1 : 0)
            .animation(animation)
    }
}
