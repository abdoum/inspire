//
//  MasterLogin.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct MasterLogin: View {
    @State var isLog: Bool = false
    
    var body: some View {
        if isLog {
            ProfileView(isLog: $isLog, experience: MOCK_EXPERIENCES[2])
        } else {
            SignInView(signUpUser: .empty, isLog: $isLog)
        }
    }
}

struct MasterLogin_Previews: PreviewProvider {
    static var previews: some View {
        MasterLogin()
    }
}
