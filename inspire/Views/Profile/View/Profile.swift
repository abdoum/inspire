//
//  MasterProfileView.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct Profile: View {
    
    @Binding var isLog: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                ButtonView(labelButton: "Se déconnecter", action: {isLog = false}).buttonConnexionViewStyle(style: ButtonConnexionViewStyleBlack())
            }.padding()
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(isLog: .constant(true))
    }
}
