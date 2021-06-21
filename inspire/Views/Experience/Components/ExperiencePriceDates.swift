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
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(0.6)
                    .frame(height: 100)
                VStack {
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
                        .padding()
                        Spacer()
                        Button(action: {
                            //Giovanni's VIEW...
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 200.0, height: 60.0)
                                    .foregroundColor(.white)
                                    .padding()
                                HStack {
                                    Image(systemName: "calendar")
                                        .foregroundColor(.black)
                                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                    Text("Voir les dates")
                                        .foregroundColor(.black)
                                    
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .padding()
    }
}

struct ExperiencePriceDates_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencePriceDates(experiences: MOCK_EXPERIENCES[0])
    }
}
