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
        ScrollView {
            VStack {
                InfosHeaderPRofileView(imageName: "maria_lopez", fullName: "Professionel", job: "Chef de projet")
                    .padding()
                ButtonView(label: "Créer une expérience", action: {})
                InfosProfileView()
                    .hasScrollEnabled(false)
                ButtonSettingsProfileView(imageName: "checkmark.shield", label: " Mon compte est vérifié", editName: "Modifier", action: {})
                ButtonSettingsProfileView(imageName: "creditcard", label: "Paiements et versements", editName: "Voir", action: {})
                ButtonSettingsProfileView(imageName: "gearshape", label: "Paramètres", editName: "Modifier", action: {})
                DescriptionProfileView()
                    .padding(.top)
                ButtonView(label: "Se déconnecter", action: {isLog = false}).buttonConnexionViewStyle(style: ButtonConnexionViewStyleBlack())
            }.padding()
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(isLog: .constant(true))
    }
}
