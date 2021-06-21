//
//  ProfileView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI

struct ProfileView: View {
    @Binding var isLog: Bool
    @EnvironmentObject var userManager: UserManager
    let experience: Experience
    
    var body: some View {
        if let user = userManager.currentUser {
            VStack {
                ScrollView {
                    InfosHeaderProfileView(imageName: user.avatar, fullName: "\(user.firstname)  \(user.lastname)", job: experience.title, isPro: true)
                        .padding()
                    InfosProfileView2(user: MOCK_EXPERIENCES[2], isLog: isLog)

                    SettingsButtonView(imageName: "checkmark.shield", label: " Mon compte est vérifié", editName: "Modifier", action: {})
                    SettingsButtonView(imageName: "creditcard", label: "Paiements et versements", editName: "Voir", action: {})
                    SettingsButtonView(imageName: "gearshape", label: "Paramètres", editName: "Modifier", action: {})
                    DescriptionProfileView(descriptionProfile: user.biography)
                    
                }.padding()
                LoginButton(label: "Se déconnecter", action: {isLog = false}).buttonConnexionViewStyle(style: ButtonConnexionViewStyleBlack())
            }
        } else {
            Text("Veuillez vous connecter !")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isLog: .constant(true), experience: MOCK_EXPERIENCES[0]).environmentObject(UserManager())
    }
}
