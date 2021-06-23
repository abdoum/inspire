//
//  ProfileView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI
import CoreLocation

struct ProfileView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var imageLoader: ImageLoader
    @Binding var isLog: Bool
    let experience: Experience
    let user = previewUser
    
    var body: some View {
        NavigationView {
//            if let user = userManager.currentUser {
                ScrollView{
                    VStack {
                        InfosHeaderProfileView(imageName: user.avatar, fullName: "\(user.firstname)  \(user.lastname)", job: experience.title, isPro: true)
                            .padding(.top)
                        InfosProfileView2(user: experience, isLog: isLog)
                        
                        //                    SettingsButtonView(imageName: "checkmark.shield", label: " Mon compte est vérifié", editName: "Modifier", action: {})
                        //                    SettingsButtonView(imageName: "creditcard", label: "Paiements et versements", editName: "Voir", action: {})
                        //                    SettingsButtonView(imageName: "gearshape", label: "Paramètres", editName: "Modifier", action: {})
                        DescriptionProfileView(descriptionProfile: user.biography)
                        LoginButton(label: "Se déconnecter", action: {isLog = false}).buttonConnexionViewStyle(style: ButtonConnexionViewStyleBlack())
                            .padding()
                    }
                    .navigationBarTitle(Text("Compte"))
                    .navigationBarTitleDisplayMode(.inline)
                }
//            } else {
//                Text("Veuillez vous connecter !")
//            }
        }
    }
}

let previewUser = User(firstname: "Valentin", lastname: "Jizhaki", email: "test1@test.com", password: "123456", avatar: "ingenierie", biography: "Etudes et diplômes : collège et lycée Sainte-Marie à Anthony; maîtrise de mathématiques et informatique (université Nancy I-Henri Poincaré)", spokenLanguages: "Francais", location: CLLocationCoordinate2D(latitude: 39.302809, longitude: 99.275837), notificationsAccepted: false, role: UserRole.author, isLogged: true)


struct ProfileView_Previews: PreviewProvider {
   
    static var previews: some View {
        ProfileView(isLog: .constant(true), experience: MOCK_EXPERIENCES[0])
            .environmentObject(UserManager())
            .environmentObject(ImageLoader(urlString: ""))
    }
}
