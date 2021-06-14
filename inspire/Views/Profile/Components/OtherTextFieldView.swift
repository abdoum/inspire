//
//  OtherTextFieldView.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct OtherTextFieldView: View {
    
    @Binding var fullName: String
    @Binding var birthdate: String
    @Binding var address: String
    @Binding var city: String
    @Binding var zipCode: String
    
    func informations(fullName: String, birthDate: String, address: String, city: String, zipCode: String) -> some View {
        VStack {
            TextField(fullName, text: .constant(""))
            TextField(birthDate, text: .constant(""))
            TextField(address, text: .constant(""))
            TextField(city, text: .constant(""))
            TextField(zipCode, text: .constant(""))

        }
    }
    
    var body: some View {
        VStack {
            informations(fullName: "Nom Prénom", birthDate: "Date de naissance", address: "Adresse", city: "Ville", zipCode: "Code postale")
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct OtherTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        OtherTextFieldView(fullName: .constant(""), birthdate: .constant(""), address: .constant(""), city: .constant(""), zipCode: .constant(""))
    }
}
