//
//  MainView.swift
//  inspire
//
//  Created by Jonathan Duong on 16/06/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Suggestions()
                .tabItem {
                    Image(systemName: "house")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }

//            UploadPostView()
//                .tabItem {
//                    Image(systemName: "plus.square")
//                }
//
//            NotificationsView()
//                .tabItem {
//                    Image(systemName: "heart")
//                }
            
            MasterLogin()
                .tabItem {
                    Image(systemName: "person")
                }
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
