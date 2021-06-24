//
//  ExperiencesView.swift
//  Inspire5
//
//  Created by Jonathan Duong on 17/06/2021.
//

import SwiftUI


struct UserHistoryView: View {
    
    @EnvironmentObject var sharedExperiences : SharedExperiences
    @State private var accepted : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    if !accepted {
                        VStack (alignment: .leading) {
                            VStack  (alignment: .leading) {
                                UpComingExperiences(accepted: $accepted)
                            }
                        }
                        FirstItem()
                        SecondItem()
                        ThirdItem()
                    } else {
                        FirstItem()
                        SecondItem()
                        ThirdItem()
                    }
                }
            }
            .navigationBarTitle("Mes expériences", displayMode: .inline)
        }
    }
}

struct FirstItem: View {
    @EnvironmentObject var sharedExperiences : SharedExperiences
    
    var body: some View {
        VStack {
            HStack {
                SectionTitle(content: "Proposées")
                    .font(.title2)
                    .padding(.leading)
                Spacer()
            }
            UserHistoryList(experiences: sharedExperiences.leftExperiences)
        }
    }
}
struct SecondItem: View {
    @EnvironmentObject var sharedExperiences : SharedExperiences
    var body: some View {
        VStack {
            HStack {
                SectionTitle(content: "Planifiées")
                    .font(.title2)
                    .padding(.leading)
                Spacer()
            }
            UserHistoryList(experiences: sharedExperiences.rightExperiences)
        }
    }
}
struct ThirdItem: View {
    @EnvironmentObject var sharedExperiences : SharedExperiences
    var body: some View {
        VStack {
            HStack {
                SectionTitle(content: "Effectuées")
                    .font(.title2)
                    .padding(.leading)
                Spacer()
            }
            UserHistoryList(experiences: sharedExperiences.leftExperiences)
        }
    }
}


struct UserHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserHistoryView()
                .environmentObject(FavorisManager())
                .environmentObject(SharedExperiences())
        }
    }
}
