//
//  ExperiencePriceDates.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 16/06/2021.
//

import SwiftUI

struct ExperiencePriceDates: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                    .opacity(0.6)
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                VStack {
                    
                    HStack {
                        VStack {
                            Text("Price €")
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
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 200.0, height: 60.0)
                                .foregroundColor(.white)
                                .padding()
                            HStack {
                                Image(systemName: "calendar")
                                Text("Voir les dates")
                                
                            }
                            .padding()
                            
                        }
                        
                    }
                }
                
            }
        }
        .padding(.bottom)
        
        
        
        
        
        
    }
}

struct ExperiencePriceDates_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencePriceDates()
    }
}
