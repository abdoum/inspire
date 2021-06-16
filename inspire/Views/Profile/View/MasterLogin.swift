//
//  MasterLogin.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct MasterLogin: View {
    
    @State var isLog: Bool = false
    
    var body: some View {
        if isLog {
            Profile(isLog: $isLog)
        } else {
            SignIn(signUpUser: .empty, isLog: $isLog)
        }
    }
}

struct MasterLogin_Previews: PreviewProvider {
    static var previews: some View {
        MasterLogin()
    }
}
