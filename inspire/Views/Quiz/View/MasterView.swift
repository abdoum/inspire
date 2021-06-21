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
            ExplorerView(showMap: .constant(false), showQuiz: $showQuiz )
                .tabItem { Image(systemName: "house") }
            FavorisView()
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
        MasterView(showQuiz: .constant(true))
            .environmentObject(Quiz())
            .environmentObject(SharedExperiences())
    }
}
