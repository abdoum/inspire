//
//  UpComingExperiences.swift
//  inspire
//
//  Created by Jonathan Duong on 20/06/2021.
//

import SwiftUI

struct UpComingExperiences: View {
    
    @State var isCanceled: Bool = false
    @State var isProblem: Bool = false
    
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(0.6)
                    .frame(height: 260)
                
                VStack {
                    HStack {
                        
                        //Text("Nombre d'expériences à venir")
                        Text("(1)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        
                        //Text("Nombre d'expériences à venir")
                        Text("à venir")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding([.top, .leading])
                    
                    PopupHomepage(experienceCategory: experiencesCategories[1])
                        .padding(.horizontal)
                    
                    HStack {
                        Button(action: {
                        }) {
                            Image(systemName: "nosign")
                                // .foregroundColor(isCanceled ? .red : .green)
                                .foregroundColor(.white)
                                .opacity(1)
                                .font(.system(size: 25))
                            Text("Annuler")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        //                .frame(width: 120, height: 20)
                        .padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1)
                                .opacity(1)
                        )
                        
                        Spacer()
                        
                        
                        Button(action: {
                        }) {
                            Image(systemName: "questionmark.circle")
                                // .foregroundColor(isCanceled ? .red : .green)
                                .foregroundColor(.white)
                                .opacity(1)
                                .font(.system(size: 25))
                            Text("Un problème")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1)
                                .opacity(1)
                        )
                    }
                    .padding()
                }
                .padding(.top, -7.0)
            }
        }
        
    }
}

struct UpComingExperiences_Previews: PreviewProvider {
    static var previews: some View {
        UpComingExperiences()
    }
}
