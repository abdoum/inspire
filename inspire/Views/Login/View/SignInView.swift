//
//  SignInView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI
import UIKit

struct SignInView: View {
    @EnvironmentObject var userManager: UserManager
    @State var signUpUser: SignUpUser
    @State var signUp: Bool = false
    @State var signIn: Bool = false
    @State var invalidAttempts = 0
    @Binding var isLog: Bool
    
    
    var body: some View {
        NavigationView {
            VStack {
                TitleScreen(content: "Identification")
                    .offset(y: -50)
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    EmailTextFieldView(email: $signUpUser.email)
                }
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.secondary)
                    PasswordTextFieldView(password: $signUpUser.password)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundColor(invalidAttempts == 0 ? Color.clear : Color.red)
                        ).modifier(ShakeEffect(animatableData: CGFloat(invalidAttempts)))
                }
                
                OtherLoginButton(label: "Mot de passe oublié ?", action: {signIn.toggle()})
                    .offset(x: 100)
                    .padding()
                    .sheet(isPresented: $signIn, content: {
                        ResetPassword(signUpUser: .empty, signIn: $signIn)
                    })
                LoginButton(label: "Connexion", action: login).disabled(signUpUser.email.isEmpty || signUpUser.password.isEmpty)
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
        withAnimation(.default) {
            self.invalidAttempts += 1
        }
    }
}

struct ShakeEffect: GeometryEffect {
    var travailDistance: CGFloat = 6
    var numOfShakes: CGFloat = 4
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: travailDistance * sin(animatableData * .pi * numOfShakes), y: 0))
    }
}
