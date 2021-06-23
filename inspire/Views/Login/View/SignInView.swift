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
    @Binding var isLog: Bool
    @State var classicLogin = false
    
    var body: some View {
        NavigationView {
            VStack {
                LoginButton(label: "Connexion", action: {
                                classicLogin.toggle()})
                    .sheet(isPresented: $classicLogin, content: {
                        ClassicLoginScreen(signUpUser: signUpUser, isLog: $isLog, classicLogin: $classicLogin)
                    })
                
                OtherLoginButton(label: "Créer un compte", action: {signUp.toggle()})
                    .sheet(isPresented: $signUp, content: {
                        SignUpView(signUpUser: .empty, signIn: $signUp)
                    }).offset(y: 200)
                Text("Ou")
                SignInWithApple()
                    .padding()
                
            }.padding()
            .navigationTitle("Compte")
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        
        SignInView(signUpUser: SignUpUser(firstname: "e", lastname: "f", email: "", password: "", confirmPassword: "", avatar: "", biography: "", spokenLanguages: "", role: .guest), isLog: .constant(false))
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}

struct ClassicLoginScreen: View {
    @EnvironmentObject var userManager: UserManager
    @State var signUpUser: SignUpUser
    @State var signUp: Bool = false
    @State var signIn: Bool = false
    @State var invalidAttempts = 0
    @Binding var isLog: Bool
    @Binding var classicLogin : Bool
    
    var body: some View {
        Group {
            TitleScreen(content: "Connexion")
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.secondary)
                EmailTextFieldView(email: $signUpUser.email)
            }
            .padding(.horizontal)
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
            .padding()
            HStack {
                Spacer()
                OtherLoginButton(label: "Mot de passe oublié ?", action: {signIn.toggle()})
                    .foregroundColor(.customSecondary)
                    .padding()
                    .sheet(isPresented: $signIn, content: {
                        ResetPassword(signUpUser: .empty, signIn: $signIn)
                    })
            }
            LoginButton(label: "Connexion", action: {
                login()
            }
            
            ).disabled(signUpUser.email.isEmpty || signUpUser.password.isEmpty)
        }
    }
    func login() {
        isLog = userManager.login(email: signUpUser.email, password: signUpUser.password)
        if !isLog{
            withAnimation(.default) {
                self.invalidAttempts += 1
            }
        }else{
            classicLogin = false
        }
    }
}
