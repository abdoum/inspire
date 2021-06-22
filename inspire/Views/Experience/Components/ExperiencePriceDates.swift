//
//  ExperiencePriceDates.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 16/06/2021.
//

import SwiftUI

struct ExperiencePriceDates: View {
    
    let experiences: Experience
    
    var body: some View {
        HStack {
            VStack {
                Text("\(experiences.price.description) €")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(1)
                Text("par personne")
                    .foregroundColor(.white)
                    .opacity(0.5)
            }
            Spacer()
            Button(action: {
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 200.0, height: 60.0)
                        .foregroundColor(.white)
                        .padding()
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                            .opacity(0.8)
                        Text("Voir les dates \n  disponibles")
                            .foregroundColor(.black)
                        
                    }
                }
            }
        }
        .ignoresSafeArea([])
        .padding(.horizontal)
        .padding(.bottom)
        .background(Color.black.opacity(0.6))
    }
}


struct ExperiencePriceDates_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            ExperiencePriceDates(experiences: MOCK_EXPERIENCES[0])
        }
        .ignoresSafeArea(.all)
    }
}
