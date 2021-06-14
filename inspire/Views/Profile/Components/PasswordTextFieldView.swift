//
//  PasswordTextFieldView.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct PasswordTextFieldView: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Mot de passe", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
            .disableAutocorrection(true)

    }
}

struct PasswordTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextFieldView(password: .constant(""))
    }
}
