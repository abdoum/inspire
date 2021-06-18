//
//  MasterView.swift
//  inspire
//
//  Created by dr on 18/06/2021.
//

import SwiftUI

struct MasterView: View {
    var body: some View {
        TabView {
            ExplorerView(showMap: .constant(false), experiences: experiencesCategories[0])
                .tabItem { Image(systemName: "house") }
            FavorisView(experienceCategory: experiencesCategories[0])
                .tabItem { Image(systemName: "heart") }
            UserHistoryView()
                .tabItem { Image(systemName: "latch.2.case") }
            MasterLogin()
                .tabItem { Image(systemName: "person") }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
