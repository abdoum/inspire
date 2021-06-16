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
    @Binding var birthdate: String
    @Binding var address: String
    @Binding var city: String
    @Binding var zipCode: String
    
    func informations(firstName: TextFieldInfos, lastName: TextFieldInfos, birthDate: TextFieldInfos, address: TextFieldInfos, city: TextFieldInfos, zipCode: TextFieldInfos) -> some View {
        VStack {
            textField(firstName, text: $firstName)
            textField(lastName, text: $lastName)
            textField(birthDate, text: $birthdate)
            textField(address, text: $address)
            textField(city, text: $city)
            textField(zipCode, text: $zipCode)
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
            informations(firstName: .init("Prénom"), lastName: .init("Nom"), birthDate: .init("Date de naissance", placeHolder: "DD-MM-YYYY"), address: .init("Adresse"), city: .init("Ville"), zipCode: .init("Code postale"))
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
        OtherTextFieldView(firstName: .constant(""), lastName: .constant(""), birthdate: .constant(""), address: .constant(""), city: .constant(""), zipCode: .constant(""))
    }
}
