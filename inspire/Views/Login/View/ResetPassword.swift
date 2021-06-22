//
//  ResetPassword.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct ResetPassword: View {

    @State var signUpUser: SignUpUser
    @Binding var signIn: Bool
    
    var body: some View {
        VStack {
            TitleScreen(content: "Réinitialisatioin du mot de passe")
                .frame(maxWidth: 280)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            VStack {
                EmailTextFieldView(email: $signUpUser.email)
                    .padding(.bottom)
                    
                LoginButton(label: "Confirmer", action: {})
                    .offset(y: 25)
                OtherLoginButton(label: "Annuler", action: {signIn.toggle()})
                    .padding(.top)
                    .offset(y: 25)
            }
            .padding()
        }
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        
        ResetPassword(signUpUser: SignUpUser.empty, signIn: .constant(true))
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}
