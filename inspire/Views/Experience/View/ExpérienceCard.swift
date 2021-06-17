//
//  ExpérienceCard.swift
//  inspire
//
//  Created by Giovanni Gabriel on 16/06/2021.
//

import SwiftUI

struct Expe_rienceCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            ZStack {
                Image("Image1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 350, alignment: .center)
                    .clipped()
                
                //if experince.isFavorite {

                Image(systemName: "heart.fill")
                    .foregroundColor(Color.red)
                    .frame(width: 250, height: 300, alignment: .topTrailing)
                //}
            }
            
            
            HStack(alignment: .center){
    
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
                Text("4,91")
                    .font(.body)
                Text("(377)")
                    .font(.caption)
                Text("France")
                    .foregroundColor(Color.gray)
            }
            .padding()
            
            VStack {
        Text("Titre de l'expérience")
            .font(.title2)
           
        Text("A partir de 13€/personne")
            .font(.subheadline)
            }
            .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black, lineWidth: 2)
                .opacity(0.3)
        )
    }
}

struct Expe_rienceCard_Previews: PreviewProvider {
    static var previews: some View {
        Expe_rienceCard()
    }
}
