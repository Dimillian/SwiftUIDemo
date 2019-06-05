//
//  UserDetailView.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 04/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import SwiftUI

struct UserDetailView : View {
    let user: User
    
    var body: some View {
            VStack {
                Image(systemName: user.imageName)
                Text(user.name)
                Text(user.username).lineLimit(0)
            }
    }
}

#if DEBUG
struct UserDetailView_Previews : PreviewProvider {
    static var previews: some View {
        UserDetailView(user: sampleData[0])
    }
}
#endif
