//
//  EmailTextFieldView.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct EmailTextFieldView: View {
    
    @Binding var email: String
    @State private var isValidate = false
    
    var body: some View {
        HStack {
            VStack {
                Text("Adresse Email")
            TextField("Email", text: $email) { changed in
                print(changed)
            } onCommit: {
                isValidate = isValidEmail(email)
            }.onChange(of: email, perform: { value in
                isValidate = isValidEmail(email)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            }
            
            Spacer()
            
            if isValidate || !email.isEmpty {
                Image(systemName: isValidate ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(isValidate ? .green : .red)
                    .font(.title)
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}


struct EmailTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        EmailTextFieldView(email: .constant(""))
    }
}
