//
//  Categorie.swift
//  inspire
//
//  Created by ab on 14/06/2021.
//

import SwiftUI

struct Categorie: View {
    let title : String
    let numberOfExistingExperiences : Int
    var body: some View {
        ZStack {
            Image("rempotage")
                .resizable()
                .scaledToFill()
                .frame(width: 157, height: 140, alignment: .center)
                .cornerRadius(14)
            VStack(alignment: .leading){
                Text(title)
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.vertical)
                
                    
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: 80, height: 26, alignment: .center)
                    .foregroundColor(.white)
                    .overlay(
                        Text("\(numberOfExistingExperiences) offres")
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .foregroundColor(.customPrimary)
                    )
                    
            }.alignmentGuide(HorizontalAlignment.leading) { _ in  80 }
        }
    }
}

struct Categorie_Previews: PreviewProvider {
    static var previews: some View {
        Categorie(title: "Saisonnier", numberOfExistingExperiences: 103)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
