//
//  PasswordTextFieldView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct PasswordTextFieldView: View {
    @Binding var password: String
    
    var body: some View {
        VStack {
            SecureField("Mot de passe", text: $password)
                .cornerRadius(8)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        
    }
}
