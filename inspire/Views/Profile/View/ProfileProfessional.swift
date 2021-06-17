//
//  ProfileProfessional.swift
//  inspire
//
//  Created by Jonathan Duong on 14/06/2021.
//

import SwiftUI

struct ProfileProfessional: View {
    
    @Binding var isLog: Bool
    
    var body: some View {
            VStack {
                ScrollView {
                InfosHeaderProfessionnalProfileView(imageName: "maria_lopez", fullName: "Professionel", job: "Chef de projet")
                    .padding()
                ButtonView(label: "Créer une expérience", action: {})
                InfosProfileView()
                    .hasScrollEnabled(false)
                ButtonSettingsProfileView(imageName: "checkmark.shield", label: " Mon compte est vérifié", editName: "Modifier", action: {})
                ButtonSettingsProfileView(imageName: "creditcard", label: "Paiements et versements", editName: "Voir", action: {})
                ButtonSettingsProfileView(imageName: "gearshape", label: "Paramètres", editName: "Modifier", action: {})
                DescriptionProfileView(descriptionProfile: "Instances of DateFormatter create string representations of NSDate objects, and convert textual representations of dates and times into NSDate objects. For user-visible representations of dates and times, DateFormatter provides a variety of localized presets and configuration options. For fixed format representations of dates and times, you can specify a custom format string.")
                    .padding(.top)
            }.padding()
                ButtonView(label: "Se déconnecter", action: {isLog = false}).buttonConnexionViewStyle(style: ButtonConnexionViewStyleBlack())
                    .padding()
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileProfessional(isLog: .constant(true))
    }
}
