//
//  ExperienceContact.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 16/06/2021.
//

import SwiftUI

struct ExperienceContact: View {
    
    func buttonContact(image: String, label: String) -> some View {
        Button(action: {}) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 165.0, height: 80.0)
                    .foregroundColor(.black)
                    .opacity(0.2)
                VStack {
                    Image(systemName: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 18.0, height: 18.0)
                        .foregroundColor(.black)
                    Spacer()
                        .frame(height: 10)
                    Text(label)
                        .foregroundColor(.black)
                }
            }
        }
    }
    let language: String
    
    var body: some View {
        VStack {
            HStack {
                Image("manTalking")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30.0, height: 30.0)
                Text("Langue(s) : \(language)")
                Spacer()
            }
            .font(.subheadline)
            
            Divider()
            
            HStack {
                buttonContact(image: "envelope", label: "Me contacter")
                Spacer(minLength: 1)
                buttonContact(image: "checkmark.shield", label: "Confidentialité \n   et Sécurité")
            }
        }
    }
}

struct ExperienceContact_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceContact(language: "TEST")
    }
}
