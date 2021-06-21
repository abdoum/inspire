//
//  MasterView.swift
//  inspire
//
//  Created by dr on 18/06/2021.
//

import SwiftUI

struct MasterView: View {
    
    @Binding var showQuiz : Bool
    
    var body: some View {
        TabView {
            ExplorerView(experiences: experiencesCategories[0], experience: MOCK_EXPERIENCES, showQuiz: $showQuiz)
                .tabItem { Image(systemName: "house")
                    Text("Accueil")
                }
            FavorisView(experienceCategory: experiencesCategories[0])
                .tabItem { Image(systemName: "heart")
                    Text("Favoris")
                }
            UserHistoryView(experienceCategory: MOCK_EXPERIENCES[0])
                .tabItem { Image(systemName: "latch.2.case")
                    Text("Expériences")
                }
            MasterLogin()
                .tabItem { Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(showQuiz: .constant(true))
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}
