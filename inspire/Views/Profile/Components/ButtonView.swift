//
//  ButtonConnexionView.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct ButtonView: View {
    
    let labelButton: String
    let action: () -> Void
    
    func button(label: String) -> some View {
        Button(action: action, label: {
            Text(label)
        })
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
        .buttonStyle(PlainButtonStyle())
    }
    
    var body: some View {
        VStack {
        button(label: labelButton)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(labelButton: "Connexion") {
            print("")
        }
    }
}
