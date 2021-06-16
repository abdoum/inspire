//
//  ExperienceReviews.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct ExperienceReviews: View {
    var body: some View {
        VStack {
            HStack {
                Text("Les avis")
                .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding(.vertical)
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.black)
                    .opacity(0.8)
                Text("Note")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .opacity(0.8)
                Text("(reviewNb)")
                Spacer()
                Button(action: {}) {
                    HStack {
                        Spacer()
                        Text("Voir tout")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .underline()
                        .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    }
                }
                
            }
            HStack {
                Image("SteveJobs")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60.0, height: 60.0)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                VStack {
                    HStack {
                        Text("Name")
                        Image(systemName: "checkmark.circle.fill")
                    }
                    Text("Date")
                }
                Spacer()
                
            }
            HStack {
                Text("Contrairement à une opinion répandue, le Lorem Ipsum n'est pas simplement du texte aléatoire. Il trouve ses racines dans une oeuvre de la littérature latine classique datant de 45 av. J.-C., le rendant vieux de 2000 ans. Un professeur du Hampden-Sydney College, en Virginie, s'est intéressé à un des mots latins les plus obscurs, consectetur, extrait d'un passage du Lorem Ipsum, et en étudiant tous les usages de ce mot dans la littérature classique, découvrit la source incontestable du Lorem Ipsum.")
                Spacer()
            }

        }
        
    }
}

struct ExperienceReviews_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceReviews()
    }
}
