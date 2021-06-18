//
//  ResetPassword.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct ResetPassword: View {

    @State var signUpUser: SignUpUser
    @Binding var signIn: Bool
    
    var body: some View {
        VStack {
            TitleScreen(content: "Récupérer mot de passe")
                .offset(y: -45)
            VStack {
                EmailTextFieldView(email: $signUpUser.email)
                    .padding(.bottom)
                    
                LoginButton(label: "Confirmer", action: {})
                    .offset(y: 25)
                OtherLoginButton(label: "Annuler", action: {signIn.toggle()})
                    .padding(.top)
                    .offset(y: 25)
            }
            .padding()
        }
    }
}
