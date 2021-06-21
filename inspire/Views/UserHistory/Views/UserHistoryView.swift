//
//  ExperiencesView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI


struct UserHistoryView: View {
    
    let categoryArray: [String] = [
        "Artisanat", "Cuisine", "Informatique", "Ostéopathe"
    ]
    let experienceCategory: Experience
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack (alignment: .leading) {
                        VStack  (alignment: .leading) {
//                            SearchView()
//                                .padding()
                            UpComingExperiences()
                        }
                    }
                    FirstItem()
                    SecondItem()
                    ThirdItem()
                }
            }
            .navigationBarTitle("Mes expériences", displayMode: .inline)
        }
    }
}

struct FirstItem: View {
    var body: some View {
        VStack {
            HStack {
                SectionTitle(content: "Proposées")
                    .font(.title2)
                    .padding(.leading)
                Spacer()
                SeeMoreButton()
                    .padding(.trailing)
            }
            UserHistoryList(experiences: MOCK_EXPERIENCES)
        }
        .frame(height: 300)
    }
}
struct SecondItem: View {
    var body: some View {
        VStack {
            HStack {
                SectionTitle(content: "Planifiées")
                    .font(.title2)
                    .padding(.leading)
                Spacer()
                SeeMoreButton()
                    .padding(.trailing)
            }
            UserHistoryList(experiences: MOCK_EXPERIENCES)
        }
    }
}
struct ThirdItem: View {
    var body: some View {
        VStack {
            HStack {
                SectionTitle(content: "Effectuées")
                    .font(.title2)
                    .padding(.leading)
                Spacer()
                SeeMoreButton()
                    .padding(.trailing)
            }
            UserHistoryList(experiences: MOCK_EXPERIENCES)
        }
    }
}


struct UserHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserHistoryView(experienceCategory: MOCK_EXPERIENCES[0])
        }
    }
}
