//
//  ResetPassword.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct ResetPassword: View {
    
    @State private var email: String = ""
    @Binding var signIn: Bool
    
    var body: some View {
        VStack {
            TitleView(title: "Récupérer mot de passe")
                .offset(y: -50)
            VStack {
                EmailTextFieldView(email: $email)
                    .padding(.bottom)
                    
                ButtonView(labelButton: "Confirmer", action: {})
                    .buttonConnexionViewStyle(style: ButtonConnexionViewStyleBlack())
                    .offset(y: 25)
                ButtonView(labelButton: "Annuler", action: {signIn.toggle()})
                    .offset(y: 25)
            }
            .padding()
        }
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword(signIn: .constant(false))
    }
}
