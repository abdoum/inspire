//
//  SignUp.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct SignUp: View {
    
    @State var signUpUser: SignUpUser
    @Binding var signIn: Bool
//    var title: some View {
//        TitleView(title: "Inscription")
//    }
    
    var body: some View {
            VStack {
                TitleView(title: "Inscription")
                    .offset(y: 75)
                Spacer()
                OtherTextFieldView(firstName: $signUpUser.firstname, lastName: $signUpUser.lastname)
                EmailTextFieldView(email: $signUpUser.email)
                PasswordTextFieldView(password: $signUpUser.password)
                SecureField("Confirmer mot de passe", text: $signUpUser.confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                ButtonView(label: "S'inscrire", action: {
                    let user = User(user: signUpUser)
                    print(user)
                })
                .buttonConnexionViewStyle(style: ButtonConnexionViewStyleBlack())
                Spacer()
                TextLink(label: "Déjà un compte ?", action: {signIn.toggle()})
            }
            .padding()
        }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(signUpUser: .empty, signIn: .constant(false))
    }
}
