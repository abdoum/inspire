//
//  SignUpView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct SignUpView: View {
    
    @State var signUpUser: SignUpUser
    @Binding var signIn: Bool

    var body: some View {
            VStack {
                TitleScreen(content: "Inscription")
                    .offset(y: 75)
                Spacer()
                InfosPersonalTextFieldView2(firstName: $signUpUser.firstname, lastName: $signUpUser.lastname)
                EmailTextFieldView(email: $signUpUser.email)
                PasswordTextFieldView(password: $signUpUser.password)
                SecureField("Confirmer mot de passe", text: $signUpUser.confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                LoginButton(label: "S'inscrire", action: {
                    let user = User(user: signUpUser)
                    print(user)
                })
                .buttonConnexionViewStyle(style: ButtonConnexionViewStyleBlack())
                .padding(.top, 50)
                Spacer()
                OtherLoginButton(label: "Déjà un compte ?", action: {signIn.toggle()})
                    .offset(y: -20)
            }
            .padding()
        }
}
