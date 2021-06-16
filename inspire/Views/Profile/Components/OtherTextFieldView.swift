//
//  OtherTextFieldView.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct OtherTextFieldView: View {
    
    @Binding var firstName: String
    @Binding var lastName: String
    
    func informations(firstName: TextFieldInfos, lastName: TextFieldInfos) -> some View {
        VStack {
            textField(firstName, text: $firstName)
            textField(lastName, text: $lastName)
        }
    }
    func textField(_ textFieldInfo: TextFieldInfos, text: Binding<String>) -> some View {
        Group {
            Text(textFieldInfo.label)
            TextField(textFieldInfo.placeHolder, text: text)
        }
    }
    
    var body: some View {
        VStack {
            informations(firstName: .init("Prénom"), lastName: .init("Nom"))
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct TextFieldInfos {
    
    let label: String
    let placeHolder: String
    
    init(_ label: String, placeHolder: String? = nil) {
        self.label = label
        self.placeHolder = placeHolder ?? label
    }
}

struct OtherTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        OtherTextFieldView(firstName: .constant(""), lastName: .constant(""))
    }
}
