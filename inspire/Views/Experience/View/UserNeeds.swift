//
//  UserNeeds.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct UserNeeds: View {
    
    var items = ["Il provient en fait des sections 1.10.32 et 1.10.33 du -De Finibus Bonorum et Malorum- (Des Suprêmes Biens et des Suprêmes Maux) de Cicéron.", "Cet ouvrage, très populaire pendant la Renaissance, est un traité sur la théorie de l'éthique. Les premières lignes du Lorem Ipsum, -Lorem ipsum dolor sit amet...-, proviennent de la section 1.10.32.-, ", "On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Ce qu'il faut préparer")
                    .font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            ForEach(items, id: \.self) { item in
                
                HStack {
                    Button(action: {}) {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.black)
                            .opacity(0.5)
                        
                    }.font(.system(size: 30))
                    
                    Text(item)
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 2)
                        .opacity(0.3)
                )
            }
        }
        
        
        .padding(.vertical)
    }
    
}

struct UserNeeds_Previews: PreviewProvider {
    static var previews: some View {
        UserNeeds()
    }
}
