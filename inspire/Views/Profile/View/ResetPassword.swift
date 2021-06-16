//
//  ResetPassword.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct ResetPassword: View {
    
    @State var signUpUser: SignUpUser
    @Binding var signIn: Bool
    
    var body: some View {
        VStack {
            TitleView(title: "Récupérer mot de passe")
                .offset(y: -50)
            VStack {
                EmailTextFieldView(email: $signUpUser.email)
                    .padding(.bottom)
                    
                ButtonView(label: "Confirmer", action: {})
                    .offset(y: 25)
                TextLink(label: "Annuler", action: {signIn.toggle()})
                    .padding(.top)
                    .offset(y: 25)
            }
            .padding()
        }
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword(signUpUser: .empty, signIn: .constant(false))
    }
}
