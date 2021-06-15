//
//  SignUp.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct SignUp: View {
    
    
    @State private var fullName: String = ""
    @State private var birthdate: String = ""
    @State private var address: String = ""
    @State private var city: String = ""
    @State private var zipCode: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var email: String = ""
    @Binding var signIn: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TitleView(title: "Inscription")
                    .offset(y: -50)
                Spacer()
                OtherTextFieldView(fullName: $fullName, birthdate: $birthdate, address: $address, city: $city, zipCode: $zipCode)
                
                EmailTextFieldView(email: $email)
                
                PasswordTextFieldView(password: $password)
                
                SecureField("Confirmer mot de passe", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                ButtonView(label: "S'inscrire", action: {})
                    .buttonConnexionViewStyle(style: ButtonConnexionViewStyleBlack())
                Spacer()
                TextLink(label: "Déjà un compte ?", action: {signIn.toggle()})
                
            }
            .padding()
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(signIn: .constant(false))
    }
}
