//
//  MasterSignInView.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct SignIn: View {
    
    @State var signUpUser: SignUpUser
    @State var signUp: Bool = false
    @State var signIn: Bool = false
    @Binding var isLog: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TitleView(title: "Identification")
                    .offset(y: -50)
                EmailTextFieldView(email: $signUpUser.email)
                PasswordTextFieldView(password: $signUpUser.password)
                TextLink(label: "Mot de passe oublié ?", action: {signIn.toggle()})
                    .offset(x: 100)
                    .padding()
                    .sheet(isPresented: $signIn, content: {
                        ResetPassword(signUpUser: .empty, signIn: $signIn)
                    })
                ButtonView(label: "Connexion", action: {isLog = true})
                TextLink(label: "Créer un compte", action: {signUp.toggle()})
                    .sheet(isPresented: $signUp, content: {
                        SignUp(signUpUser: .empty, signIn: $signUp)
                    }).offset(y: 200)
                Text("Ou")
                SignInWithApple()
            }.padding()
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn(signUpUser: .empty, isLog: .constant(false))
    }
}
