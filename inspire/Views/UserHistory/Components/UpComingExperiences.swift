//
//  UpComingExperiences.swift
//  inspire
//
//  Created by Jonathan Duong on 20/06/2021.
//

import SwiftUI

struct UpComingExperiences: View {
    
    @EnvironmentObject var favorisManager: FavorisManager
    @State private var showCanceled: Bool = false
    @State private var showProblem: Bool = false
    @State private var showDetails: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(0.6)
                    .frame(maxHeight: 260)
                VStack {
                    HStack {
                        //Text("Nombre d'expériences à venir")
                        Text("(1)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        
                        //Text("Nombre d'expériences à venir")
                        Text("À venir")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding([.top, .leading])
                    PopupHomepage(experience: MOCK_EXPERIENCES[4])
                        .padding(.horizontal)
                        .fullScreenCover(isPresented: $showDetails) {
                            ExperienceDetails(experience: MOCK_EXPERIENCES[4])
                        }.onTapGesture {
                            showDetails.toggle()
                        }
                    HStack {
                        Spacer(minLength: 1)
                        Button(action: {
                            showCanceled.toggle()
                        }) {
                            Image(systemName: "nosign")
                                .foregroundColor(.white)
                                .opacity(1)
                                .font(.system(size: 25))
                            Text("Annuler")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .alert(isPresented: $showCanceled, content: {
                                Alert(title: Text("Annulation"), message: Text("Êtes-vous sûre de vouloir supprimer votre réservation ?"), primaryButton: Alert.Button.default(Text("Oui"), action: {
                                    print("OK !")
                                }), secondaryButton: .destructive(Text("Non"), action: {
                                    print("Annuler")
                                })
                                )})
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1)
                                .opacity(1)
                        )
                        .padding(.bottom, 5)
                        .padding(.trailing, 18)
                        
                    }
                    Spacer()
                }
                .padding(.top, -7.0)
            }
        }
        
    }
}

struct UpComingExperiences_Previews: PreviewProvider {
    static var previews: some View {
        UpComingExperiences()
            .environmentObject(FavorisManager())
    }
}
