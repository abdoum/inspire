//
//  ExperienceDetails.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct ExperienceDetails: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var active = true
    let experience: Experience
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ScrollView {
                        VStack {
                            Image(experience.category.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .listRowInsets(EdgeInsets())
                            VStack {
                                AuthorMainInfos(imageName: experience.author.avatar, fullName: "\(experience.author.firstname) \(experience.author.lastname.uppercased())", specialisation: experience.category.specialisation, rate: experience.rate)
                                ExperienceContact(language: experience.author.spokenLanguages)
                                    .padding(.leading).padding(.trailing)
                                ExperienceProgram(experience.description, lineLimit: 6)
                                UserNeeds()
                                ExperienceReviews()
                            }
                            .padding()
                        }
                    }
                    ExperiencePriceDates(experiences: MOCK_EXPERIENCES[0])
                }
            }.navigationBarItems(leading:
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Circle()
                                            .frame(width: 50, height: 30)
                                            .foregroundColor(.white)
                                            .overlay(
                                                Image(systemName: "xmark")
                                                    .foregroundColor(.black)
                                            )
                                    }), trailing:
                                        Button(action: {
                                            //add to FavorisView
                                        }, label: {
                                            Circle()
                                                .frame(width: 50, height: 30)
                                                .foregroundColor(.white)
                                                .overlay(
                                                    Image(systemName: "heart")
                                                        .foregroundColor(.black)
                                                )
                                        }) )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ExperienceDetails_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceDetails(experience: MOCK_EXPERIENCES[0])
    }
}
