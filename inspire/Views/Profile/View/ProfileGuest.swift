//
//  ProfileGuest.swift
//  inspire
//
//  Created by Jonathan Duong on 16/06/2021.
//

import SwiftUI

struct ProfileGuest: View {
    
    @Binding var isLog: Bool
    
    var body: some View {
            VStack {
                ScrollView {
                InfosHeaderGuestProfileView(imageName: "maria_lopez", fullName: "Guest Name")
                    .padding()
                InfosProfileView()
                    .hasScrollEnabled(false)
                ButtonSettingsProfileView(imageName: "checkmark.shield", label: " Mon compte est vérifié", editName: "Modifier", action: {})
                ButtonSettingsProfileView(imageName: "creditcard", label: "Paiements et versements", editName: "Voir", action: {})
                ButtonSettingsProfileView(imageName: "gearshape", label: "Paramètres", editName: "Modifier", action: {})
                DescriptionProfileView(descriptionProfile: "Instances of DateFormatter create string representations of NSDate objects, and convert textual representations of dates and times into NSDate objects. For user-visible representations of dates and times, DateFormatter provides a variety of localized presets and configuration options. For fixed format representations of dates and times, you can specify a custom format string.")
                    .padding(.top)
            }
                ButtonView(label: "Se déconnecter", action: {isLog = false}).buttonConnexionViewStyle(style: ButtonConnexionViewStyleBlack())
                    .padding()

        }
    }
}

struct ProfileGuest_Previews: PreviewProvider {
    static var previews: some View {
        ProfileGuest(isLog: .constant(false))
    }
}
