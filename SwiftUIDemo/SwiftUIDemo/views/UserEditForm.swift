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
    
    var body: some View {
        NavigationView {
            Text(user.name)
                .navigationBarItems(trailing: EditButton())
                .navigationBarTitle(Text("Edit \(user.name)"))
        }
    }
}

#if DEBUG
struct UserEditForm_Previews : PreviewProvider {
    static var previews: some View {
        UserEditForm(user: sampleData[0])
    }
}
#endif
