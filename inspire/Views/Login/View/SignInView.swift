//
//  SignInView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var userManager: UserManager
    @State var signUpUser: SignUpUser
    @State var signUp: Bool = false
    @State var signIn: Bool = false
    @Binding var isLog: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TitleScreen(content: "Identification")
                    .offset(y: -50)
                EmailTextFieldView(email: $signUpUser.email)
                PasswordTextFieldView(password: $signUpUser.password)
                OtherLoginButton(label: "Mot de passe oublié ?", action: {signIn.toggle()})
                    .offset(x: 100)
                    .padding()
                    .sheet(isPresented: $signIn, content: {
                        ResetPassword(signUpUser: .empty, signIn: $signIn)
                    })
                LoginButton(label: "Connexion", action: login)
                OtherLoginButton(label: "Créer un compte", action: {signUp.toggle()})
                    .sheet(isPresented: $signUp, content: {
                        SignUpView(signUpUser: .empty, signIn: $signUp)
                    }).offset(y: 200)
                Text("Ou")
                SignInWithApple()
                    .padding()
            }.padding()
        }
    }
    
    func login() {
        isLog = userManager.login(email: signUpUser.email, password: signUpUser.password)
    }
}
