//
//  MasterSignInView.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct SignIn: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var signUp: Bool = false
    @State var signIn: Bool = false
    @Binding var isLog: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TitleView(title: "Identification")
                    .offset(y: -50)
                EmailTextFieldView(email: $email)
                PasswordTextFieldView(password: $password)
                ButtonView(labelButton: "Mot de passe oublié ?", action: {signIn.toggle()})
                    .offset(x: 100)
                    .sheet(isPresented: $signIn, content: {
                        ResetPassword(signIn: $signIn)
                    })
                ButtonView(labelButton: "Connexion", action: {isLog = true})
                    .buttonConnexionViewStyle(style: ButtonConnexionViewStyleBlack())
                ButtonView(labelButton: "Créer un compte", action: {signUp.toggle()})
                    .sheet(isPresented: $signUp, content: {
                        SignUp(signIn: $signUp)
                    }).offset(y: 200)
//                Text("Ou")
//                    .padding(.top)
                
            }.padding()
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn(isLog: .constant(false))
    }
}
