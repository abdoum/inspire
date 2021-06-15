//
//  ButtonConnexionView.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct ButtonView: View {
    
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action ,label: {
            ZStack {
                Capsule()
                    .frame(height: 50)
                    .foregroundColor(Color.customPrimary)
                Text(label)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
            }
        })
        }
}

struct TextLink: View {
    
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(label)
                .underline()
                .foregroundColor(.black)
                .font(.headline)
        })
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TextLink(label: "Connexion", action: {})
    }
}

//    let labelButton: String
//    let action: () -> Void
//
//    func button(label: String) -> some View {
//        Button(action: action, label: {
//            Text(label)
//        })
//        .padding()
//        .frame(maxWidth: .infinity, alignment: .center)
//        .buttonStyle(PlainButtonStyle())
//    }
//
//    var body: some View {
//        VStack {
//        button(label: labelButton)
//        }
//    }
