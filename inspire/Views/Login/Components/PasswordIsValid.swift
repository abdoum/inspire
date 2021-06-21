//
//  PasswordIsValidView.swift
//  inspire
//
//  Created by Jonathan Duong on 20/06/2021.
//

import SwiftUI

struct PasswordIsValidView: View {
    
    @State private var password: String = ""
    @State private var invalidAttempts = 0
    @State private var isValidate = false
    
    var body: some View {
        SecureField("Mot de passe", text: $password).onChange(of: password, perform: { value in
            isValidate = isValidPassword(password)
        })
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // 1 lettre Capitale,
        // 1 lettre minuscule
        // 1 chiffre
        // 1 spécial
        //  min 8 characters
        let regex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",regex)
        return passwordCheck.evaluate(with: password)

    }
}

struct PasswordIsValidView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordIsValidView()
            .previewLayout(.sizeThatFits)
    }
}
