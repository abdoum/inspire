//
//  UserNeeds.swift
//  EssaiYvesInspireDetailExperience
//
//  Created by mac11 on 15/06/2021.
//

import SwiftUI

struct UserNeeds: View {
    
    var items = [
        "Confirmer votre RDV 24 heures au plus tard avant l'horaire planifié",
        "Prendre connaissance des recommandations propres au site visité (voir message transmis lors de l'inscription)",
        "Se présenter à l'accueil muni d'un masque de protection COVID"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Ce qu'il faut préparer")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.vertical)
                Spacer()
            }
            ForEach(items, id: \.self) {
                ButtonSelected(description: $0)
            }
        }
        .padding()
    }
}

struct ButtonSelected: View {
    let description: String
    @State var isSelected: Bool = false
    var body: some View {
        Button(action: {isSelected.toggle()}) {
            HStack {
                Image(systemName: isSelected ? "checkmark.circle" : "xmark.circle")
                    .foregroundColor(isSelected ? .green : .red)
                    .opacity(0.5)
                    .font(.system(size: 30))
                Text(description)
                    .foregroundColor(.black)
                Spacer()
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black, lineWidth: 2)
                .opacity(0.3))
    }
}

struct UserNeeds_Previews: PreviewProvider {
    static var previews: some View {
        UserNeeds()
    }
}
